library(phonTools)


### Name: sdellipse
### Title: Standard deviation Ellipse
### Aliases: sdellipse

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

## alternatively, a covariance matrix may be specified directly. 
par (mfrow = c(1,1))
sdellipse (matrix(c(1,.5,.5,1),2,2), means = c(0,0), 
add = FALSE, stdev = 1)
sdellipse (matrix(c(1,-.5,-.5,1),2,2), means = c(0,0), 
add = TRUE, stdev = 1)



