library(phonTools)


### Name: rmvtnorm
### Title: Random multivariate normal variables
### Aliases: rmvtnorm

### ** Examples

## Examples of draws from different bivariate normal distributions
## and standard deviation ellipses drawn to fit them.
par (mfrow = c(2,2))
draws = rmvtnorm (n = 1000, k = 2, sigma = .3)
plot (draws)
sdellipse (draws, stdev = 3, lwd = 3, col = 2)

draws = rmvtnorm (n = 1000, k = 2, sigma = -.3)
plot (draws)
sdellipse (draws, stdev = 3, lwd = 3, col = 2)

draws = rmvtnorm (n = 1000, k = 2, sigma = -.7)
plot (draws)
sdellipse (draws, stdev = 3, lwd = 3, col = 2)

draws = rmvtnorm (n = 1000, k = 2, sigma = .7)
plot (draws)
sdellipse (draws, stdev = 3, lwd = 3, col = 2)



