library(OneTwoSamples)


### Name: interval_estimate4
### Title: Two sided or one sided interval estimation of 'mu' of one normal
###   sample
### Aliases: interval_estimate4

### ** Examples

x=rnorm(10, mean = 1, sd = 0.2); x
interval_estimate4(x, sigma = 0.2, side = -1)
interval_estimate4(x, side = 1)



