library(reader)


### Name: force.frame
### Title: returns a dataframe if 'unknown.data' can in anyway relate to
###   such:
### Aliases: force.frame

### ** Examples

# create a matrix, binary file, text file, big.matrix.descriptor
orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
test.files <- c("temp.rda","temp.txt")
mymat <- matrix(rnorm(100),nrow=10)
# not run yet # require(bigmemory)
save(mymat,file=test.files[1])
write.table(mymat,file=test.files[2],col.names=FALSE,row.names=FALSE)
test.frames <- list(mymat = mymat,
 myrda = test.files[1], mytxt = test.files[2] )
 # not run yet #: ,mybig = describe(as.big.matrix(mymat)) )
sapply(sapply(test.frames,is),"[",1)
# run the function on each, reporting specs of the object returned
for (cc in 1:length(test.frames)) {
  the.frame <- force.frame(test.frames[[cc]])
  cat(names(test.frames)[cc],": dim() => ",
      paste(dim(the.frame),collapse=","),
      "; is() => ",is(the.frame)[1],"\n",sep="")
}
unlink(test.files)
setwd(orig.dir) # reset working dir to original



