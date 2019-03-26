library(reader)


### Name: get.delim
### Title: Determine the delimiter for a text data file.
### Aliases: get.delim

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
df <- data.frame(ID=paste("ID",101:110,sep=""),
  scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
# save data to various file formats
test.files <- c("temp.txt","temp2.txt","temp3.csv")
write.table(df,file=test.files[1],col.names=FALSE,row.names=FALSE,sep="|",quote=TRUE)
write.table(df,file=test.files[2],col.names=TRUE,row.names=TRUE,sep="\t",quote=FALSE)
write.csv(df,file=test.files[3])
# report the delimiters
for (cc in 1:length(test.files)) { 
  cat("\n",test.files[cc],": ")
  print(get.delim(test.files[cc])) }
unlink(test.files)
setwd(orig.dir) # reset working dir to original



