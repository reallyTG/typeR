library(ncf)


### Name: Sncf
### Title: Nonparametric (cross-)correlation function for spatio-temporal
###   data
### Aliases: Sncf
### Keywords: regression smooth spatial

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
fit1 <- Sncf(x = x, y = y, z = z, resamp = 0)
## Not run: plot.Sncf(fit1)
summary(fit1)

# multivariate nonparametric cross-covariance function
fit2 <- Sncf(x = x, y = y, z = z, w = w, resamp = 0)
## Not run: plot(fit2)
summary(fit2)



