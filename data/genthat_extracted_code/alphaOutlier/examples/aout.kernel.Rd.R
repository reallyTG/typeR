library(alphaOutlier)


### Name: aout.kernel
### Title: Find alpha-outliers in arbitrary univariate data using kernel
###   density estimation
### Aliases: aout.kernel
### Keywords: nonparametric

### ** Examples

set.seed(23)
tempx <- rnorm(1000, 0, 1)
tempx[1] <- -2.5
aout.kernel(tempx[1:10], alpha = 0.1, kern.adj = 1, xlim = c(-3,3), outints = TRUE)
# not run:
# aout.kernel(tempx[1:200], alpha = 0.1, kern.adj = 1, xlim = c(-3,3))



