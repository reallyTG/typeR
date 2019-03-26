library(haven)


### Name: read_xpt
### Title: Read and write SAS transport files
### Aliases: read_xpt write_xpt

### ** Examples

tmp <- tempfile(fileext = ".xpt")
write_xpt(mtcars, tmp)
read_xpt(tmp)



