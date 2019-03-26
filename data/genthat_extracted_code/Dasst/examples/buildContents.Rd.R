library(Dasst)


### Name: buildContents
### Title: Build contents for an object of class Dasst.
### Aliases: buildContents

### ** Examples

mydf <- data.frame(a=c(1,2,3), b=c("one","two","three"),c=c(1.1,2.2,3.3))
myObj <- Dasst()
myObj[1] <- buildContents("MyTest.OUT","*TestSec",
 "@ID  NAME VALUE","  1   one 1.100", mydf)



