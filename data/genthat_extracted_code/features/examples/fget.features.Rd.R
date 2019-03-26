library(features)


### Name: fget
### Title: Utility function to extract features from an object of 'class
###   "features"'.
### Aliases: fget fget.features

### ** Examples

# Estimating the smooth and the derivatives of a noisy and discretely sampled function. 
n <- 200
x <- sort(runif(n))
y <- exp(-0.2 * sin(2*pi*x)) + rnorm(n, sd=0.05)

ans <- features(x, y)
fget(ans)




