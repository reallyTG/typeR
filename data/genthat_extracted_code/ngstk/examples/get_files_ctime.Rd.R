library(ngstk)


### Name: get_files_ctime
### Title: Function to check file create time and according the requirement
###   to return check value
### Aliases: get_files_ctime

### ** Examples

file_a <- tempfile()
file_b <- tempfile()
file.create(c(file_a, file_b))
get_files_ctime(input_files = c(file_a, file_b), return_ctime = TRUE)



