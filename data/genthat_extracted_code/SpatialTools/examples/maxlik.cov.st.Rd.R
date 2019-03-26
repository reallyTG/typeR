library(SpatialTools)


### Name: maxlik.cov.st
### Title: Determines maximum likelihood estimates of covariance parameters
### Aliases: maxlik.cov.st
### Keywords: covariance spatial maximum likelihood

### ** Examples

#Generate locations and observed times
coords <- matrix(rnorm(40), ncol = 2)
time <- rep(1:2, each = 10)

#Calculate distance matrix for time vector
T <- dist1(matrix(time))

#create design matrix
X <- cbind(1, coords)

#create mean for observed data to be generated
mu <- X %*% c(1, 2, 3)

#generate covariance matrix for spatio-temporal data
V <- exp(-dist1(coords)) * .25^T

#generate observe data
y <- rmvnorm(mu = mu, V = V)

maxlik.cov.st(X = X, y = y, coords = coords, time = time,
    sp.type = "exponential", range.par = 1, error.ratio = 0, 
    t.type = "ar1", t.par = .5, reml = TRUE)




