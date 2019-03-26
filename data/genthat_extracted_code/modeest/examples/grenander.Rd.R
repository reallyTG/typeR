library(modeest)


### Name: grenander
### Title: The Grenander mode estimator
### Aliases: grenander Grenander

### ** Examples

# Unimodal distribution
x <- rnorm(1000, mean = 23, sd = 0.5) 

## True mode
normMode(mean = 23, sd = 0.5) # (!)

## Parameter 'k'
k <- 5

## Many values of parameter 'p'
ps <- seq(0.1, 4, 0.01)

## Estimate of the mode with these parameters
M <- sapply(ps, function(p) grenander(x, p = p, k = k))

## Distribution obtained
plot(density(M), xlim = c(22.5, 23.5))




