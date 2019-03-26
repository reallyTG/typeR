library(spam)


### Name: spam operations
### Title: Basic Linear Algebra for Sparse Matrices
### Aliases: Ops.spam spam.ops %*%-methods %*%,ANY,ANY-method
###   %*%,spam,spam-method %*%,spam,matrix-method %*%,spam,numeric-method
###   %*%,matrix,spam-method %*%,numeric,spam-method %d*%
###   %d*%,spam,spam-method %d*%,spam,ANY-method %d*%,matrix,spam-method
###   %d*%,matrix,ANY-method %d*%,spam,numeric-method
###   %d*%,numeric,spam-method %d*%,numeric,matrix-method
###   %d*%,numeric,numeric-method %d+% %d+%,spam,spam-method
###   %d+%,spam,ANY-method %d+%,matrix,spam-method %d+%,matrix,ANY-method
###   %d+%,spam,numeric-method %d+%,numeric,matrix-method
###   %d+%,numeric,spam-method %d+%,numeric,numeric-method
###   +,spam,spam-method +,matrix,spam-method +,spam,matrix-method
###   +,ANY,spam-method +,spam,ANY-method -,spam,spam-method
###   -,matrix,spam-method -,spam,matrix-method -,ANY,spam-method
###   -,spam,ANY-method *,spam,spam-method *,ANY,spam-method
###   *,spam,ANY-method /,spam,spam-method /,ANY,spam-method
###   /,spam,ANY-method ^,spam,spam-method ^,ANY,spam-method
###   ^,spam,ANY-method &,spam,ANY-method &,spam,spam-method
###   &,ANY,spam-method |,spam,ANY-method |,ANY,spam-method
###   |,spam,spam-method ^,spam-method %%,spam-method %/%,spam-method
###   >,spam-method >=,spam-method <,spam-method <=,spam-method
###   ==,spam-method !=,spam-method norm norm.spam norm,ANY-method
###   norm,spam,character-method norm,spam,missing-method
###   norm,numeric,missing-method norm,numeric,character-method
###   norm,matrix,missing-method norm,matrix,character-method t.spam
###   ncol,spam-method nrow,spam-method dim,ANY-method dim,spam-method
###   [.spam [<-.spam [<-,spam,missing,missing-method
###   [<-,spam,missing,vector-method [<-,spam,vector,missing-method
###   [<-,spam,vector,vector-method [<-,spam,matrix,missing-method
###   [<-,spam,matrix,matrix-method [<-,spam,spam,missing-method
###   [<-,spam,ANY,ANY-method plot.spam subset.spam assign.spam
### Keywords: algebra

### ** Examples

# create a weight matrix and scale it:
## Not run: 
##D wij <- distmat
##D # with distmat from a nearest.dist(..., upper=TRUE) call
##D 
##D n <- dim(wij)[1]
##D 
##D wij@entries <- kernel( wij@entries, h) # for some function kernel
##D wij <- wij + t(wij) + diag.spam(n)     # adjust from diag=FALSE, upper=TRUE
##D 
##D sumwij <- wij %*% rep(1,n)
##D     # row scaling:
##D     #   wij@entries <- wij@entries/sumwij[ wij@colindices]
##D     # col scaling:
##D wij@entries <- wij@entries/sumwij[ rep(1:n, diff(wij@rowpointers))]
## End(Not run)



