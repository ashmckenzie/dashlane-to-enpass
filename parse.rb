#!/usr/bin/env ruby

File.open('Dashlane Export.csv') do |file|
	file.each_line do |line|
		fields = line.strip.scan(/"[^"]*"/).map { |x| x.gsub(/^"|"$/, '') }

		label = fields[0]
		url = fields[1]
		password = fields[-2]
		login = fields[-3]

		next if url.empty?
		next if [ 'https:\\', 'http:\\' ].include?(url)
		next if [ 'https:\\', 'http:\\' ].include?(login)

		#puts "label=[%s], url=[%s], login=[%s], password=[%s]" % [ label, url, login, password ]
		puts '"%s",username,"%s",password,"%s",url,"%s",""' % [ label, login, password, url ]
	end
end
