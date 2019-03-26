library(xfun)


### Name: gsub_file
### Title: Search and replace strings in files
### Aliases: gsub_file gsub_files gsub_dir gsub_ext

### ** Examples

library(xfun)
f = tempfile()
writeLines(c("hello", "world"), f)
gsub_file(f, "world", "woRld", fixed = TRUE)
readLines(f)



