library(spam)


### Name: spam
### Title: Sparse Matrix Class
### Aliases: spam.creation initialize,spam-method spam spam.list
###   spam.numeric spam,list-method spam,numeric-method
###   as.spam,matrix-method as.spam,numeric-method as.spam,spam-method
###   as.spam,dist-method as.spam,list-method as.spam as.spam.spam
###   as.spam.numeric as.spam.matrix as.spam.chol.NgPeyton as.spam.dist
###   as.spam.list is.spam
### Keywords: algebra

### ** Examples

# old message, do not loop, when you create a large sparse matrix
set.seed(13)
nz <- 128
ln <- nz^2
smat <- spam(0,ln,ln)
is <- sample(ln,nz)
js <- sample(ln,nz)
system.time(for (i in 1:nz) smat[is[i], js[i]] <- i)
system.time(smat[cbind(is,js)] <- 1:nz)

getClass("spam")


options(spam.NAOK=TRUE)
as.spam(c(1, NA))



