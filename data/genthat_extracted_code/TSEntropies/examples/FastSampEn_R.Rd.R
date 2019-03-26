library(TSEntropies)


### Name: FastSampEn_R
### Title: FastSampEn_R
### Aliases: FastSampEn_R
### Keywords: FastSampEn R entropy fast sample

### ** Examples

timser <- rnorm(2000)
FastSampEn_R(timser)
FastSampEn_R(timser, r = 0.1*sd(timser))
FastSampEn_R(timser, dim = 3, r = 0.1*sd(timser))




