library(epinet)


### Name: SimulateDyadicLinearERGM
### Title: Simulates an ERGM network using given covariate values
### Aliases: SimulateDyadicLinearERGM
### Keywords: graphs

### ** Examples

# Construct a network of 30 individuals
set.seed(3)
N <- 30
# Build dyadic covariate matrix
# Have a single covariate for overall edge density; this is the Erdos-Renyi model
nodecov <- matrix(1:N, nrow = N)
dcm <- BuildX(nodecov)
# Simulate network
examplenet <- SimulateDyadicLinearERGM(N, dyadiccovmat = dcm, eta = -1.8)

# Another example
set.seed(1)
N <- 50
mycov <- data.frame(id = 1:N, xpos = runif(N), ypos = runif(N))
dyadCov <- BuildX(mycov, binaryCol = list(c(2, 3)),binaryFunc = c("euclidean"))
# Build network
eta <- c(0,-7)
net <- SimulateDyadicLinearERGM(N = N, dyadiccovmat = dyadCov, eta = eta)



