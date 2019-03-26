library(SpatialTools)


### Name: maxlik.cov.sp
### Title: Determines maximum likelihood estimates of covariance parameters
### Aliases: maxlik.cov.sp
### Keywords: covariance spatial maximum likelihood

### ** Examples

#generate 20 random (x, y) coordinates
coords <- matrix(rnorm(20), ncol = 2)

#create design matrix
X <- cbind(1, coords)

#create mean for observed data to be generated
mu <- X %*% c(1, 2, 3)

#generate covariance matrix
V <- exp(-dist1(coords))

#generate observe data
y <- rmvnorm(mu = mu, V = V)

#find maximum likelihood estimates of covariance parameters
maxlik.cov.sp(X = X, y = y, coords = coords,
    sp.type = "exponential", range.par = 1, error.ratio = 0, 
    reml = TRUE)



