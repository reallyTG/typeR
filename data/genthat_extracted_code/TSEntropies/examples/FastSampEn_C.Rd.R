library(TSEntropies)


### Name: FastSampEn_C
### Title: FastSampEn_C
### Aliases: FastSampEn_C
### Keywords: C FastSampEn entropy fast sample

### ** Examples

timser <- rnorm(2000)
FastSampEn_C(timser)
FastSampEn_C(timser, r = 0.1*sd(timser))
FastSampEn_C(timser, dim = 3, r = 0.1*sd(timser))




