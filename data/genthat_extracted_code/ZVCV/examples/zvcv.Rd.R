library(ZVCV)


### Name: zvcv
### Title: ZV-CV for general expectations
### Aliases: zvcv

### ** Examples

# Estimating the mean of theta1 when theta is bivariate normally distributed with:
mymean <- c(1,2)
mycov <- matrix(c(1,0.5,0.5,2),nrow=2)

# Perfect draws from the target distribution (could be replaced with
# approximate draws from e.g. MCMC or SMC)
N <- 50
require(mvtnorm)
set.seed(1)
samples <- rmvnorm(N, mean = mymean, sigma = mycov)
integrand <- samples[,1]

# derivatives of Gaussian wrt x
derivatives <- t( apply(samples,1,function(x) -solve(mycov)%*%(x - mymean)) ) 

# Estimates without ZV-CV (i.e. vanilla Monte Carlo integration)
# Without the ZVCV package
mean(integrand)
# With the ZVCV package
zvcv(integrand,samples,derivatives,options = list(polyorder = 0))$expectation

# ZV-CV with fixed specifications
# 2nd order polynomial with LASSO
sprintf("%.15f",zvcv(integrand, samples, derivatives)$expectation)
# 2nd order polynomial with OLS
sprintf("%.15f",zvcv(integrand, samples, derivatives,
options = list(polyorder = 2, regul_reg = FALSE))$expectation) 

# ZV-CV with cross validation
# Choose between OLS and LASSO, with the order selected using cross validation
myopts <- list(list(polyorder = Inf, regul_reg = FALSE),list(polyorder = Inf)) 
temp <- zvcv(integrand,samples,derivatives,options = myopts) 
temp$polyorder # The chosen control variate order
sprintf("%.15f",temp$expectation) # The expectation based on the minimum MSE control variate
temp$regul_reg # Flag for if the chosen control variate uses regularisation




