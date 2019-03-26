library(ncf)


### Name: Sncf2D
### Title: Anisotropic nonparametric (cross-)correlation function for
###   spatio-temporal data
### Aliases: Sncf2D
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
# anisotorpic nonparametric covariance function at 30 and 60 degrees
fit1 <- Sncf2D(x = x, y = y, z = z, resamp = 0, angle = c(30, 60))
## Not run: plot(fit1)
summary(fit1)

# What distance is the peak in correlation
cc.offset(fit1)



