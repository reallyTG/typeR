library(pinbasic)


### Name: pin_est
### Title: Estimating PIN
### Aliases: pin_est

### ** Examples

# Loading simulated data for frequently traded stock

data("BSfrequent")

# Optimization with HAC initial values and Lin-Ke likelihood factorization

pin_freq <- pin_est(numbuys = BSfrequent[,"Buys"],
                    numsells = BSfrequent[,"Sells"])



