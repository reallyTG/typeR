library(EpiModel)


### Name: netest
### Title: Dynamic Network Model Estimation
### Aliases: netest
### Keywords: model

### ** Examples

# Initialize a network of 100 nodes
nw <- network.initialize(n = 100, directed = FALSE)

# Set formation formula
formation <- ~edges + concurrent

# Set target statistics for formation
target.stats <- c(50, 25)

# Obtain the offset coefficients
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 10)

# Estimate the STERGM using the edges dissolution approximation
est <- netest(nw, formation, target.stats, coef.diss,
              set.control.ergm = control.ergm(MCMC.burnin = 1e5,
                                              MCMC.interval = 1000))
est

# To estimate the STERGM directly, use edapprox = FALSE
# est2 <- netest(nw, formation, target.stats, coef.diss, edapprox = FALSE)




