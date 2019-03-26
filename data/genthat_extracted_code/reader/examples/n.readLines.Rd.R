library(reader)


### Name: n.readLines
### Title: Read 'n' lines (ignoring comments and header) from a file.
### Aliases: n.readLines

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
dat <- matrix(sample(100),nrow=10)
write.table(dat,"temp.txt",col.names=FALSE,row.names=FALSE)
n.readLines("temp.txt",n=2,skip=2,header=FALSE)
dat[3:4,]
unlink("temp.txt")
setwd(orig.dir) # reset working directory to original



