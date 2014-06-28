local fh = io.open('/Users/wingerted/Desktop/delegated-apnic-latest', 'r')
while true do
        local line = fh.read(fh)
        if not line then break end
        local found, _, ip, range = line.find(line, '.-|CN|ipv4|(.-)|(.-)|')
        if found then
                local mask = 32 - math.log(range) / math.log(2)
                os.execute(string.format('echo %s/%s >> ChinaIPs', ip, mask))
        end
end
