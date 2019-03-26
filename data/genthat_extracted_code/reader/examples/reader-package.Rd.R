library(reader)


### Name: reader-package
### Title: Suite of Functions to Flexibly Read Data from Files
### Aliases: reader-package reader-package
### Keywords: IO manip package

### ** Examples

mydir <- "/Documents"
cat.path(mydir,"temp.doc","NEW",suf=5)
## example for the reader() function ##
df <- data.frame(ID=paste("ID",101:110,sep=""),
                 scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
test.files <- c("temp.txt","temp2.csv","temp3.rda")
write.table(df,file=test.files[1],col.names=TRUE,row.names=TRUE,sep="\t",quote=FALSE)
# file.nrow and file.ncol examples
file.nrow(test.files[1])
file.ncol(test.files[1])
write.csv(df,file=test.files[2])
save(df,file=test.files[3])
# use the same simple reader() function call to read in each file type
for(cc in 1:length(test.files)) {
    cat(test.files[cc],"\n")
    myobj <- reader(test.files[cc])  # add 'quiet=F' to see some working
    print(myobj); cat("\n\n")
}
# inspect files before deleting if desired:
#  unlink(test.files)
#
# find id column in data frame
new.frame <- data.frame(day=c("M","T","W"),time=c(9,12,3),staff=c("Mary","Jane","John"))
staff.ids <- c("Mark","Jane","John","Andrew","Sally","Mary")
new.frame; find.id.col(new.frame,staff.ids)



