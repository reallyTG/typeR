library(cvxbiclustr)


### Name: get_validation
### Title: Select Validation Set for a Matrix
### Aliases: get_validation

### ** Examples

n <- 5
p <- 4
fraction <- 0.1
Theta <- get_validation(p,n,fraction)

M <- matrix(rnorm(n*p),p,n)
YT <- t(M)
YT[Theta$ThetaV] <- NA
Y <- t(YT)
Theta



