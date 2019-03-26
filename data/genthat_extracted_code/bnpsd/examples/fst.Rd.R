library(bnpsd)


### Name: fst
### Title: Calculate FST for the admixed individuals
### Aliases: fst

### ** Examples

# set desired parameters
n <- 1000 # number of individuals
k <- 10 # number of intermediate subpopulations
s <- 0.5 # desired bias coefficient
sigma <- 1 # for 1D admixture model
# differentiation of intermediate subpopulations
F <- (1:k)/k
# construct final admixture proportions
Q <- q1d(n=n, k=k, sigma=sigma)
# lastly, calculate Fst!!! (uniform weights in this case)
F <- fst(Q, F)




