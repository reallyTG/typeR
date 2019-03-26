library(ngstk)


### Name: get_files_mtime
### Title: Function to check file last change time and according the
###   requirement to return check value
### Aliases: get_files_mtime

### ** Examples

file_a <- tempfile()
file_b <- tempfile()
file.create(c(file_a, file_b))
get_files_mtime(input_files = c(file_a, file_b), return_mtime = TRUE)



