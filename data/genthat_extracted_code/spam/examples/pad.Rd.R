library(spam)


### Name: pad
### Title: Padding a (sparse) matrix
### Aliases: pad pad.spam pad<- pad<-.spam pad<-,spam-method
###   pad<-,matrix-method
### Keywords: array

### ** Examples

x <- diag(4)
dim(x)<-c(2,8)
x

s <- diag.spam(4)
pad(s) <- c(7,3)  # any positive value can be used

s <- diag.spam(4)
pad(s) <- c(2,8)  # result is different than x



