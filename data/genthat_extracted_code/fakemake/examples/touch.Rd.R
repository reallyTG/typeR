library(fakemake)


### Name: touch
### Title: Mock the Unix 'touch' utility
### Aliases: touch

### ** Examples

file <- tempfile()
touch(file)
t1 <- file.mtime(file)
touch(file)
t2 <- file.mtime(file)
t1 < t2



