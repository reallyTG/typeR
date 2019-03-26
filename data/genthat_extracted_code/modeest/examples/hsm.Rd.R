library(modeest)


### Name: hsm
### Title: Half sample mode estimator
### Aliases: hsm HSM

### ** Examples

# Unimodal distribution
x <- rweibull(10000, shape = 3, scale = 0.9)

## True mode
weibullMode(shape = 3, scale = 0.9)

## Estimate of the mode
bandwidth <- function(n, alpha) {1/n^alpha}
hsm(x, bw = bandwidth, alpha = 2)
mlv(x, method = "hsm", bw = bandwidth, alpha = 2)




