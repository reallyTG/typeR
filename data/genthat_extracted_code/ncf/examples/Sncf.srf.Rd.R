library(ncf)


### Name: Sncf.srf
### Title: Nonparametric (Cross-)Covariance Function from stationary random
###   fields
### Aliases: Sncf.srf
### Keywords: regression smooth

### ** Examples

# first generate some sample data
x <- expand.grid(1:20, 1:5)[, 1]
y <- expand.grid(1:20, 1:5)[, 2]

# z data from an exponential random field
z <- cbind(
  rmvn.spa(x = x, y = y, p = 2, method = "exp"), 
  rmvn.spa(x = x, y = y, p = 2, method = "exp")
  )

# w data from a gaussian random field
w <- cbind(
  rmvn.spa(x = x, y = y, p = 2, method = "gaus"), 
  rmvn.spa(x = x, y = y, p = 2, method = "gaus")
  )

# multivariate nonparametric covariance function
fit1 <- Sncf.srf(x = x, y = y, z = z, avg = NULL, corr = TRUE, resamp = 0) 
## Not run: plot(fit1) 
summary(fit1)

# multivariate nonparametric cross-covariance function (with known
# marginal expectation of zero for both z and w
fit2 <- Sncf.srf(x = x, y = y, z = z, w = w, avg = 0, avg2 = 0, corr = FALSE, 
                 resamp = 0)
## Not run: plot(fit2) 
summary(fit2)



