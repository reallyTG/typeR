library(mgcv)


### Name: sdiag
### Title: Extract or modify diagonals of a matrix
### Aliases: sdiag sdiag<-
### Keywords: models smooth regression

### ** Examples

require(mgcv)
A <- matrix(1:35,7,5)
A
sdiag(A,1) ## first super diagonal
sdiag(A,-1) ## first sub diagonal

sdiag(A) <- 1 ## leading diagonal set to 1
sdiag(A,3) <- c(-1,-2) ## set 3rd super diagonal 




