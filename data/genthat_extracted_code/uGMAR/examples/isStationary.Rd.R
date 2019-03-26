library(uGMAR)


### Name: isStationary
### Title: Check the stationary condition of specified GMAR, StMAR or
###   G-StMAR model.
### Aliases: isStationary

### ** Examples

# GMAR model
params22 <- c(0.4, 0.39, 0.6, 0.3, 0.4, 0.1, 0.6, 0.3, 0.8)
isStationary(2, 2, params22)

# StMAR model
params12t <- c(-0.3, 1, 0.9, 0.1, 0.8, 0.6, 0.7, 10, 12)
isStationary(1, 2, params12t, model="StMAR")

# G-StMAR model
params12gs <- c(1, 0.1, 1, 2, 0.2, 2, 0.8, 20)
isStationary(1, c(1, 1), params12gs, model="G-StMAR")

# Restricted GMAR model
params13r <- c(0.1, 0.2, 0.3, -0.99, 0.1, 0.2, 0.3, 0.5, 0.3)
isStationary(1, 3, params13r, restricted=TRUE)

# Restricted StMAR model
params22tr <- c(-0.1, -0.2, 0.01, 0.99, 0.3, 0.4, 0.9, 3, 13)
isStationary(2, 2, params22tr, model="StMAR", restricted=TRUE)

# Restricted G-StMAR model
params13gsr <- c(1, 2, 3, -0.99, 1, 2, 3, 0.5, 0.4, 20, 30)
isStationary(1, c(1, 2), params13gsr, model="G-StMAR", restricted=TRUE)

# GMAR model as a mixture of AR(2) and AR(1) models
constraints <- list(diag(1, ncol=2, nrow=2), as.matrix(c(1, 0)))
params22c <- c(1.2, 0.8, 0.2, 0.3, 3.3, 0.7, 3, 0.8)
isStationary(2, 2, params22c, constraints=constraints)

# Such StMAR(3,2) that the AR coefficients are restricted to be the
# same for both regimes and that the second AR coefficients are
# constrained to zero.
params32trc <- c(1, 2, 0.8, -0.3, 1, 2, 0.7, 11, 12)
isStationary(3, 2, params32trc, model="StMAR", restricted=TRUE,
             constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2))



