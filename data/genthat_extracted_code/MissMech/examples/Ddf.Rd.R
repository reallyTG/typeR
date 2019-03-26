library(MissMech)


### Name: Ddf
### Title: Hessian of the observed datat Multivariate Normal Log-Likelihood
###   with Incomplete Data
### Aliases: Ddf

### ** Examples

set.seed <- 50
n <- 200
p <- 4
pctmiss <- 0.2
y <- matrix(rnorm(n * p),nrow = n)
missing <- matrix(runif(n * p), nrow = n) < pctmiss
y[missing] <- NA
mu <- c(0,0,0,0)
sig <- matrix(c(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1),4,4)
Ddf(data=y, as.matrix(mu), sig)



