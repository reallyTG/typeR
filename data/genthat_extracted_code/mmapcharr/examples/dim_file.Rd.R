library(mmapcharr)


### Name: dim_file
### Title: File dimensions
### Aliases: dim_file

### ** Examples

tmpfile <- tempfile()
write(0:9, tmpfile, ncolumns = 2)
dim_file(tmpfile)



