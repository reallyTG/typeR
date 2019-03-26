library(reader)


### Name: file.ncol
### Title: Find the number of columns (lines) in a file.
### Aliases: file.ncol

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
write.table(matrix(rnorm(100),nrow=10),"temp.txt",col.names=FALSE,row.names=FALSE)
file.ncol("temp.txt",excl.rn=TRUE)
unlink("temp.txt")
# find ncol for all files in current directory:
# [NB: use with caution, will be slow if dir contains large files]
# not run # lf <- list.files(); if(length(lf)==0) { print("no files in dir") }
# lf <- lf[classify.ext(lf)=="TXT"]
# not run (only works if length(lf)>0) # file.ncol(lf) 
setwd(orig.dir) # reset working directory to original



