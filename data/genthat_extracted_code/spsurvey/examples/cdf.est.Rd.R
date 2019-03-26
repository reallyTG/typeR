library(spsurvey)


### Name: cdf.est
### Title: Cumulative Distribution Function - Estimation
### Aliases: cdf.est
### Keywords: survey distribution

### ** Examples

z <- rnorm(100, 10, 1)
wgt <- runif(100, 10, 100)
cdfval <- seq(min(z), max(z), length=20)
cdf.est(z, wgt, vartype="SRS", cdfval=cdfval)

x <- runif(100)
y <- runif(100)
cdf.est(z, wgt, x, y, cdfval=cdfval)



