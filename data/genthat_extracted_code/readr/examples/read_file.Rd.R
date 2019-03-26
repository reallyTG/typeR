library(readr)


### Name: read_file
### Title: Read/write a complete file
### Aliases: read_file read_file_raw write_file

### ** Examples

read_file(file.path(R.home("doc"), "AUTHORS"))
read_file_raw(file.path(R.home("doc"), "AUTHORS"))

tmp <- tempfile()

x <- format_csv(mtcars[1:6, ])
write_file(x, tmp)
identical(x, read_file(tmp))

read_lines(x)



