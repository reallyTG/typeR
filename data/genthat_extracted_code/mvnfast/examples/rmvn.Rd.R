library(mvnfast)


### Name: rmvn
### Title: Fast simulation of multivariate normal random variables
### Aliases: rmvn

### ** Examples

d <- 5
mu <- 1:d

# Creating covariance matrix
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp)

set.seed(414)
rmvn(4, 1:d, mcov)

set.seed(414)
rmvn(4, 1:d, mcov)

set.seed(414)  
rmvn(4, 1:d, mcov, ncores = 2) # r.v. generated on the second core are different

###### Here we create the matrix that will hold the simulated random variables upfront.
A <- matrix(NA, 4, d)
class(A) <- "numeric" # This is important. We need the elements of A to be of class "numeric". 

set.seed(414)
rmvn(4, 1:d, mcov, ncores = 2, A = A) # This returns NULL ...
A                                     # ... but the result is here




