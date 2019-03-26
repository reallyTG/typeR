library(modeest)


### Name: meanshift
### Title: The Meanshift mode estimator
### Aliases: meanshift

### ** Examples

# Unimodal distribution
x <- rweibull(100, shape = 12, scale = 0.8)

## True mode
weibullMode(shape = 12, scale = 0.8)

## Estimate of the mode
mlv(x, method = "meanshift", par = mean(x))




