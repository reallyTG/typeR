library(tsxtreme)


### Name: depfit
### Title: Dependence model fit
### Aliases: depfit
### Keywords: models iteration multivariate ts nonparametric

### ** Examples

## generate data from an AR(1)
## with Gaussian marginal distribution
n   <- 10000
dep <- 0.5
ar    <- numeric(n)
ar[1] <- rnorm(1)
for(i in 2:n)
  ar[i] <- rnorm(1, mean=dep*ar[i-1], sd=1-dep^2)
  
## rescale the margin
ar <- qlapl(pnorm(ar))

## fit the data
params <- bayesparams()
params$maxit <- 100# bigger numbers would be
params$burn  <- 10 # more sensible...
params$thin  <- 4
fit <- depfit(ts=ar, u.mar=0.95, u.dep=0.98, par=params)

########
## density estimation with submodel=="ugm"
data <- MASS::galaxies/1e3
dens <- depfit(ts=data, par=params, submodel="ugm")



