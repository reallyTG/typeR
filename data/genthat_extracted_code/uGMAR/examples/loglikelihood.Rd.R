library(uGMAR)


### Name: loglikelihood
### Title: Compute the log-likelihood of GMAR, StMAR or G-StMAR model
### Aliases: loglikelihood

### ** Examples

# GMAR model
params13 <- c(1.4, 0.88, 0.26, 2.46, 0.82, 0.74, 5.0, 0.68, 5.2, 0.72, 0.2)
loglikelihood(VIX, 1, 3, params13)

# Restricted GMAR model, outside parameter space
params12r <- c(1.4, 1.8, 1.88, 0.29, 3.18, 0.84)
loglikelihood(VIX, 1, 2, params12r, restricted=TRUE, minval=-9999)

# StMAR model
params12t <- c(1.9, 0.85, 1.16, 1.22, 0.89, 0.13, 0.64, 3.1, 7.0)
loglikelihood(VIX, 1, 2, params12t, model="StMAR")

# Non-mixture version of StMAR model, outside parameter space
params11t <- c(0.76, 0.93, 1.35, 1.9)
loglikelihood(VIX, 1, 1, params11t, model="StMAR", minval="Hello")

# G-StMAR model
params12gs <- c(1.2, 0.8, 0.6, 1.3, 0.6, 1.1, 0.6, 3)
loglikelihood(VIX, 1, c(1,1), params12gs, model="G-StMAR")

# Restricted G-StMAR model
params13gsr <- c(1.3, 2.2, 1.4, 0.8, 2.4, 4.6, 0.4, 0.25, 0.15, 20)
loglikelihood(VIX, 1, c(2, 1), params13gsr, model="G-StMAR", restricted=TRUE)

# GMAR model as a mixture of AR(2) and AR(1) models
constraints <- list(diag(1, ncol=2, nrow=2), as.matrix(c(1, 0)))
params22c <- c(1.2, 0.85, 0.04, 0.3, 3.3, 0.77, 2.8, 0.77)
loglikelihood(VIX, 2, 2, params22c, constraints=constraints)

# Such StMAR(3,2) that the AR coefficients are restricted to be
# the same for both regimes and that the second AR coefficients are
# constrained to zero.
params32trc <- c(2.2, 1.8, 0.88, -0.03, 2.4, 0.27, 0.40, 3.9, 1000)
loglikelihood(VIX, 3, 2, params32trc, model="StMAR", restricted=TRUE,
              constraints=matrix(c(1, 0, 0, 0, 0, 1), ncol=2))



