library(spsurvey)


### Name: cdf.decon
### Title: Cumulative Distribution Function - Deconvolution
### Aliases: cdf.decon
### Keywords: survey distribution

### ** Examples

z <- rnorm(100, 10, 1)
wgt <- runif(100, 10, 100)
cdfval <- seq(min(z), max(z), length=20)
cdf.decon(z, wgt, sigma=0.25, var.sigma=0.1, vartype=
  "SRS", cdfval=cdfval)

x <- runif(100)
y <- runif(100)
cdf.decon(z, wgt, sigma=0.25, var.sigma=0.1, x, y, cdfval=
  cdfval)



