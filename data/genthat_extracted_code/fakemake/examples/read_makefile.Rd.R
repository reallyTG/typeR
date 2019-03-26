library(fakemake)


### Name: read_makefile
### Title: Read a 'Makefile' Into a 'Makelist'
### Aliases: read_makefile

### ** Examples

make_file <- file.path(tempdir(), "Makefile")
write_makefile(provide_make_list(), path = make_file)
str(make_list <- read_makefile(path = make_file))



