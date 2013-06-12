## Code snippets for looping through files and folders:
# http://stackoverflow.com/questions/2512254/iterate-through-every-file-in-one-directory

# Dir.foreach and Dir.entries also show all items in the directory - hidden and non-hidden
Dir.foreach('/path/to/dir') do |item|
  next if item == '.' or item == '..'
  # do work on real items
end

# wildcard matching:
Dir.glob('/path/to/dir/*.rb') do |rb_file|
  # do work on files ending in .rb in the desired directory
end

# all files in subdirs:
Dir.glob("**/*.txt") do |my_text_file| # note one extra "*"
  puts "working on: #{my_text_file}..."
end

# top-down traversal of a set of file paths:
require 'find'
total_size = 0
Find.find(ENV["HOME"]) do |path|
  if FileTest.directory?(path)
    if File.basename(path)[0] == .
      Find.prune       # Don't look any further into this directory.
    else
      next
    end
  else
    total_size += FileTest.size(path)
  end
end



