library(mvnfast)


### Name: rmvt
### Title: Fast simulation of multivariate Student's t random variables
### Aliases: rmvt

### ** Examples

d <- 5
mu <- 1:d
df <- 4

# Creating covariance matrix
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp) + diag(0.5, d)

set.seed(414)
rmvt(4, 1:d, mcov, df = df)

set.seed(414)
rmvt(4, 1:d, mcov, df = df)

set.seed(414)  
rmvt(4, 1:d, mcov, df = df, ncores = 2) # These will not match the r.v. generated on a single core.

###### Here we create the matrix that will hold the simulated random variables upfront.
A <- matrix(NA, 4, d)
class(A) <- "numeric" # This is important. We need the elements of A to be of class "numeric". 

set.seed(414)
rmvt(4, 1:d, mcov, df = df, ncores = 2, A = A) # This returns NULL ...
A                                     # ... but the result is here




