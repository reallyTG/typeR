library(circglmbayes)


### Name: estimateDensityBySpline
### Title: Estimate the density value from a sample by a spline
###   interpolation of the kernel density
### Aliases: estimateDensityBySpline

### ** Examples

# Compare the estimate from this function with the analytic result.
estimateDensityBySpline(rnorm(1000), 0.1)
dnorm(.1)




