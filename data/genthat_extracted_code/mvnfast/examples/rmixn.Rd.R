library(mvnfast)


### Name: rmixn
### Title: Fast simulation of r.v.s from a mixture of multivariate normal
###   densities
### Aliases: rmixn

### ** Examples

# Create mixture of two components
mu <- matrix(rep(c(1, 2, 10, 20), 2), 2, 2, byrow = TRUE)
sigma <- list(diag(c(1, 10)), matrix(c(1, -0.9, -0.9, 1), 2, 2))
w <- c(0.1, 0.9)

# Simulate
X <- rmixn(1e4, mu, sigma, w, retInd = TRUE)
plot(X, pch = '.', col = attr(X, "index"))

# Simulate with fixed seed
set.seed(414)
rmixn(4, mu, sigma, w)

set.seed(414)
rmixn(4, mu, sigma, w)

set.seed(414)  
rmixn(4, mu, sigma, w, ncores = 2) # r.v. generated on the second core are different

###### Here we create the matrix that will hold the simulated random variables upfront.
A <- matrix(NA, 4, 2)
class(A) <- "numeric" # This is important. We need the elements of A to be of class "numeric". 

set.seed(414)
rmixn(4, mu, sigma, w, ncores = 2, A = A) # This returns NULL ...
A                                         # ... but the result is here




