library(spatstat)


### Name: quantile.ewcdf
### Title: Quantiles of Weighted Empirical Cumulative Distribution Function
### Aliases: quantile.ewcdf
### Keywords: spatial nonparametric

### ** Examples

  z <- rnorm(50)
  w <- runif(50)
  Fun <- ewcdf(z, w)
  quantile(Fun, c(0.95,0.99))



