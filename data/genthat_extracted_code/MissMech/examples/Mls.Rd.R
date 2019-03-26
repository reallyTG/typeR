library(MissMech)


### Name: Mls
### Title: ML Estimates of Mean and Covariance Based on Incomplete Data
### Aliases: Mls Sexpect

### ** Examples

set.seed <- 50
n <- 200
p <- 4
pctmiss <- 0.2 # Generate 20% missing data
y <- matrix(rnorm(n * p),nrow = n)
missing <- matrix(runif(n * p), nrow = n) < pctmiss
y[missing] <- NA
ml <- Mls(data=y, mu = NA, sig = NA, tol = 1e-6, Hessian=FALSE)
ml



