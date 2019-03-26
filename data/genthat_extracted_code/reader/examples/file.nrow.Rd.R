library(reader)


### Name: file.nrow
### Title: Find the number of rows (lines) in a file.
### Aliases: file.nrow

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
write.table(matrix(rnorm(100),nrow=10),"temp.txt",col.names=FALSE)
file.nrow("temp.txt")
# use with caution, will be slow if dir contains large files
# not run # file.nrow(all.in.dir=TRUE) 
unlink("temp.txt")
setwd(orig.dir) # reset working directory to original



