library(agricolae)


### Name: design.dau
### Title: Augmented block design
### Aliases: design.dau
### Keywords: design

### ** Examples

library(agricolae)
# 4 treatments and 5 blocks
T1<-c("A","B","C","D")
T2<-letters[20:26]
outdesign <-design.dau(T1,T2, r=5,serie=2)
# field book
book<-outdesign$book
by(book,book[2],function(x) paste(x[,1],"-",as.character(x[,3])))
# write in hard disk
# write.table(book,"dau.txt", row.names=FALSE, sep="\t")
# file.show("dau.txt")
# Augmented designs in Completely Randomized Design
trt<-c(T1,T2)
r<-c(4,4,4,4,1,1,1,1,1,1,1)
outdesign <- design.crd(trt,r)
outdesign$book



