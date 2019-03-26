library(fakemake)


### Name: write_makefile
### Title: Write a 'Makelist' to File
### Aliases: write_makefile

### ** Examples

make_file <- file.path(tempdir(), "my_Makefile")
write_makefile(provide_make_list(), path = make_file)
cat(readLines(make_file), sep = "\n")



