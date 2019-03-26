library(bnpsd)


### Name: coanc
### Title: Construct the coancestry matrix of an admixture model
### Aliases: coanc

### ** Examples

# a trivial case: unadmixed individuals from independent subpopulations
n <- 5 # number of individuals/subpops
Q <- diag(rep.int(1, n)) # unadmixed individuals
F <- 0.2 # equal Fst for all subpops
Theta <- coanc(Q, F) # diagonal coancestry matryx

# a more complicated admixture model
n <- 5 # number of individuals
k <- 2 # number of intermediate subpops
sigma <- 1 # dispersion parameter of intermediate subpops
Q <- q1d(n, k, sigma) # non-trivial admixture proportions
F <- c(0.1, 0.3) # different Fst for each of the k subpops
Theta <- coanc(Q, F) # non-trivial coancestry matrix




