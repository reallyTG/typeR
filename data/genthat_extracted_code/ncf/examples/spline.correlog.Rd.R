library(ncf)


### Name: spline.correlog
### Title: Uni- and multivariate spline correlograms
### Aliases: spline.correlog
### Keywords: smooth spatial

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

# univariate spline correlogram
fit1 <- spline.correlog(x = x, y = y, z = z[, 1], resamp = 100)
## Not run: plot.spline.correlog(fit1)
summary(fit1)

# multivariate spline correlogram
fit2 <- spline.correlog(x = x, y = y, z = z, resamp = 100)
## Not run: plot.spline.correlog(fit2)
summary(fit2)

# multivariate spline cross-correlogram
fit3 <- spline.correlog(x = x, y = y, z = z, w = w, resamp = 100)
## Not run: plot.spline.correlog(fit3)
summary(fit3)



