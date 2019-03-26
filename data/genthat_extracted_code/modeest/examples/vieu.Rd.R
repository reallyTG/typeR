library(modeest)


### Name: vieu
### Title: Vieu's mode estimator
### Aliases: vieu Vieu

### ** Examples

# Unimodal distribution
x <- rlnorm(10000, meanlog = 3.4, sdlog = 0.2)

## True mode
lnormMode(meanlog = 3.4, sdlog = 0.2)

## Estimate of the mode
mlv(x, method = "vieu", kernel = "gaussian")




