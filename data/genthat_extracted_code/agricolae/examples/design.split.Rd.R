library(agricolae)


### Name: design.split
### Title: Split Plot Design
### Aliases: design.split
### Keywords: design

### ** Examples

library(agricolae)
# 4 treatments and 5 blocks in split-plot
t1<-c("A","B","C","D")
t2<-c(1,2,3)
outdesign <-design.split(t1,t2,r=3,serie=2,seed=45,kinds ="Super-Duper")#seed=45
book<-outdesign$book# field book
# write in hard disk
# write.table(book,"book.txt", row.names=FALSE, sep="\t")
# file.show("book.txt")




