library(frailtySurv)


### Name: genfrail
### Title: Generate survival data
### Aliases: genfrail
### Keywords: survival data shared frailty

### ** Examples

# Generate the same dataset 3 different ways

# Using the baseline hazard (least efficient)
set.seed(1234)
dat.1 <- genfrail(N = 300, K = 2, 
                  beta = c(log(2),log(3)),
                  frailty = "gamma", theta = 2,
                  lambda_0=function(t, tau=4.6, C=0.01) (tau*(C*t)^tau)/t)

# Using the cumulative baseline hazard
set.seed(1234)
dat.2 <- genfrail(N = 300, K = 2, 
                  beta = c(log(2),log(3)),
                  frailty = "gamma", theta = 2, 
                  Lambda_0 = function(t, tau=4.6, C=0.01) (C*t)^tau)

# Using the inverse cumulative baseline hazard (most efficient)
set.seed(1234)
dat.3 <- genfrail(N = 300, K = 2, 
                  beta = c(log(2),log(3)),
                  frailty = "gamma", theta = 2, 
                  Lambda_0_inv=function(t, tau=4.6, C=0.01) (t^(1/tau))/C)

# Generate data with PVF frailty, truncated Poisson cluster sizes, normal
# covariates, and 0.35 censorship from a lognormal distribution
dat.4 <- genfrail(N = 100, K = "poisson", K.param=c(5, 1), 
                  beta = c(log(2),log(3)),
                  frailty = "pvf", theta = 0.3, 
                  covar.distr = "lognormal", 
                  censor.rate = 0.35) # Use the default baseline hazard

# Cluster sizes have size >= 2, summarized by
summary(dat.4)

# An oscillating baseline hazard
dat.5 <- genfrail(lambda_0=function(t, tau=4.6, C=0.01, A=2, f=0.1) 
                              A^sin(f*pi*t) * (tau*(C*t)^tau)/t)

# Uniform censorship with 0.25 censoring rate
dat.6 <- genfrail(N = 300, K = 2, 
                  beta = c(log(2),log(3)),
                  frailty = "gamma", theta = 2, 
                  censor.distr = "uniform", 
                  censor.param = c(50, 150), 
                  censor.rate = 0.25,
                  Lambda_0_inv=function(t, tau=4.6, C=0.01) (t^(1/tau))/C)



