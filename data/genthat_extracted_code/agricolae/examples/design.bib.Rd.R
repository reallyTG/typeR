library(agricolae)


### Name: design.bib
### Title: Randomized Balanced Incomplete Block Designs. BIB
### Aliases: design.bib
### Keywords: design

### ** Examples

library(agricolae)
# 4 treatments and k=3 size block
trt<-c("A","B","C","D")
k<-3
outdesign<-design.bib(trt,k,serie=2,seed =41,kinds ="Super-Duper") # seed = 41
print(outdesign$parameters)
book<-outdesign$book
plots <-as.numeric(book[,1])
matrix(plots,byrow=TRUE,ncol=k)
print(outdesign$sketch)
# write in hard disk
# write.csv(book,"book.csv", row.names=FALSE)
# file.show("book.csv")




