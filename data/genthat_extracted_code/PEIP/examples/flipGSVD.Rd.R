library(PEIP)


### Name: flipGSVD
### Title: Flip output of GSVD
### Aliases: flipGSVD
### Keywords: misc

### ** Examples


set.seed(12)

n <- 5
A <- matrix(runif(n*n),nrow=n)
B <- matrix(runif(n*n),nrow=n)

VS = GSVD(A, B)

FVS = flipGSVD(VS, d1 = dim(A) , d2 = dim(B) )
## see that order of eigen vectors is reversed
diag(VS$S)
diag(FVS$S)




