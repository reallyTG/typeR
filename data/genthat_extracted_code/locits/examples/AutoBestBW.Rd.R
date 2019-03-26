library(locits)


### Name: AutoBestBW
### Title: Choose a good bandwidth for running mean smoothing of a EWS
###   spectral estimator.
### Aliases: AutoBestBW
### Keywords: smooth

### ** Examples

#
# Generate synthetic data
#
x <- rnorm(256)
#
# Compute best linear bandwidth
#
tmp <- AutoBestBW(x=x)
#
# Printing it out in my example gives:
# tmp
# [1] 168



