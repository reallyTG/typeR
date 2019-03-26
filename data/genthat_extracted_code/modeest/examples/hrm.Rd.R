library(modeest)


### Name: hrm
### Title: Bickel's half-range mode estimator
### Aliases: hrm HRM

### ** Examples

# Unimodal distribution 
x <- rgamma(1000, shape = 31.9)
## True mode
gammaMode(shape = 31.9)

## Estimate of the mode
hrm(x, bw = 0.4)
mlv(x, method = "hrm", bw = 0.4)




