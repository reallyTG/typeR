library(agricolae)


### Name: design.strip
### Title: Strip Plot Design
### Aliases: design.strip
### Keywords: design

### ** Examples

library(agricolae)
# 4 and 3 treatments and 3 blocks in strip-plot
t1<-c("A","B","C","D")
t2<-c(1,2,3)
r<-3
outdesign <-design.strip(t1,t2,r, serie=2,seed=45,kinds ="Super-Duper") # seed = 45
book <-outdesign$book # field book
# write in hard disk
# write.table(book,"book.txt", row.names=FALSE, sep="\t")
# file.show("book.txt")




