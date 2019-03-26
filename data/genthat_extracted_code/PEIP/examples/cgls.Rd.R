library(PEIP)


### Name: cgls
### Title: Conjugate gradient Least squares
### Aliases: cgls
### Keywords: misc

### ** Examples

set.seed(11)
####  perfect data with no noise
n <- 5
A <- matrix(runif(n*n),nrow=n)
B <- runif(n)
###  get right-hand-side (data)
trhs = as.vector( A %*% B  )
Lout = cgls(A, trhs , 15)

###  solution is
Lout$X[,15]

Lout$X[,15] - B






