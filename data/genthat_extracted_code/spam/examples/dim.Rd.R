library(spam)


### Name: dim
### Title: Dimensions of an Object
### Aliases: dim.spam dim<-.spam dim<-,spam-method
### Keywords: array

### ** Examples

x <- diag(4)
dim(x)<-c(2,8)
x

s <- diag.spam(4)
dim(s) <- c(2,8)  # result is different than x

s <- diag.spam(4)
pad(s) <- c(7,3)  # any positive value can be used




