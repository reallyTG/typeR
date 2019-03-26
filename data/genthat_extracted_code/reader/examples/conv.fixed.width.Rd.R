library(reader)


### Name: conv.fixed.width
### Title: Convert a matrix or dataframe to fixed-width for nice file
###   output
### Aliases: conv.fixed.width

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
df <- data.frame(ID=paste("ID",99:108,sep=""),
  scores=sample(150,10,TRUE)+30,age=sample(16,10,TRUE))
dff <- conv.fixed.width(df)
write.table(df,file="notFW.txt",row.names=FALSE,col.names=FALSE,quote=FALSE)
write.table(dff,file="isFW.txt",row.names=FALSE,col.names=FALSE,quote=FALSE)
cat("Fixed-width:\n",paste(readLines("isFW.txt"),"\n"),sep="")
cat("standard-format:\n",paste(readLines("notFW.txt"),"\n"),sep="")
unlink(c("isFW.txt","notFW.txt"))
setwd(orig.dir) # reset working dir to original



