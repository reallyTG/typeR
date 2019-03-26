library(kdensity)


### Name: plot.kdensity
### Title: Plot Method for Kernel Density Estimation
### Aliases: plot.kdensity

### ** Examples

## Using the data set "precip" to eye-ball the similarity between
## a kernel fit, a parametric fit, and a kernel with parametric start fit.
kde_gamma = kdensity(precip, kernel = "gaussian", start = "gamma")
kde = kdensity(precip, kernel = "gaussian", start = "uniform")

plot(kde_gamma, main = "Annual Precipitation in US Cities")
lines(kde_gamma, plot_start = TRUE, lty = 2)
lines(kde, lty = 3)
rug(precip)



