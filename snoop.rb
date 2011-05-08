#!/usr/bin/env ruby

# PoC Twitter Email Grabber

require 'open-uri'

html = open("http://search.twitter.com/search?q=gmail.com+OR+hotmail.com++OR+%22email+me%22").read
r = Regexp.new(/\b[A-Z0-9._%+-]+@<b>[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
matches = html.scan(r)
matches.each do |m|
  m.downcase
  m = m.delete "<b>" # Twitter annoyingly prefix a <b> tag onto the start of the email domain
  puts m
end
