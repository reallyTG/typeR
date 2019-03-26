library(agricolae)


### Name: design.youden
### Title: Incomplete Latin Square Design
### Aliases: design.youden
### Keywords: design

### ** Examples

library(agricolae)
varieties<-c("perricholi","yungay","maria bonita","tomasa")
r<-3
outdesign <-design.youden(varieties,r,serie=2,seed=23)
youden <- outdesign$book
print(outdesign$sketch)
plots <-as.numeric(youden[,1])
print(matrix(plots,byrow=TRUE,ncol=r))
print(youden) # field book.
# Write on hard disk.
# write.table(youden,"youden.txt", row.names=FALSE, sep="\t")
# file.show("youden.txt")



