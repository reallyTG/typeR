library(reader)


### Name: reader
### Title: Flexibly load from a text or binary file, accepts multiple file
###   formats.
### Aliases: reader

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
# create some datasets
df <- data.frame(ID=paste("ID",101:110,sep=""),
  scores=sample(70,10,TRUE)+30,age=sample(7,10,TRUE)+11)
DNA <- apply(matrix(c("A","C","G","T")[sample(4,100,TRUE)],nrow=10),
                                                1,paste,collapse="")
fix.wid <- c("    MyVal    Results        Check",
  "    0.234      42344          yes",
  "    0.334        351          yes","    0.224         46           no",
  "    0.214     445391          yes")
# save data to various file formats
test.files <- c("temp.txt","temp2.txt","temp3.csv",
                              "temp4.rda","temp5.fasta","temp6.txt")
write.table(df,file=test.files[1],col.names=FALSE,row.names=FALSE,sep="|",quote=TRUE)
write.table(df,file=test.files[2],col.names=TRUE,row.names=TRUE,sep="\t",quote=FALSE)
write.csv(df,file=test.files[3])
save(df,file=test.files[4])
writeLines(DNA,con=test.files[5])
writeLines(fix.wid,con=test.files[6])
# use the same reader() function call to read in each file
for(cc in 1:length(test.files)) {
  cat(test.files[cc],"\n")
  myobj <- reader(test.files[cc])  # add 'quiet=FALSE' to see some working
  print(myobj); cat("\n\n")
}
# inspect files before deleting if desired
unlink(test.files) 
# myobj <- reader(file.choose()); myobj # run this to attempt opening a file
setwd(orig.dir) # reset working directory to original



