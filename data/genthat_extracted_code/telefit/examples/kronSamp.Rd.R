library(telefit)


### Name: kronSamp
### Title: Samples a multivariate normal with a Kronecker product
###   covariance structure
### Aliases: kronSamp

### ** Examples


A = matrix(c(1,.5,.5,1), ncol=2)
B = diag(2)
x = kronSamp(A, B)




