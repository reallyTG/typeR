library(HIMA)


### Name: simHIMA
### Title: Simulation Data Generator for High-dimensional Mediation
###   Analyais
### Aliases: simHIMA

### ** Examples

n <- 100  # sample size
p <- 500 # the dimension of covariates

# the regression coefficients alpha (exposure --> mediators)
alpha <- rep(0, p) 

# the regression coefficients beta (mediators --> outcome)
beta <- rep(0, p) 

# the first four markers are true mediators.
alpha[1:4] <- c(0.45,0.5,0.55,0.6)
beta[1:4] <- c(0.5,0.45,0.4,0.35)

alpha[7:8] <- 0.5
beta[5:6] <- 0.5

# Generate simulation data
simdat = simHIMA(n, p, alpha, beta, seed=1029) 




