library(TSEntropies)


### Name: FastApEn_C
### Title: FastApEn_C
### Aliases: FastApEn_C
### Keywords: C FastApEn approximate entropy fast

### ** Examples

timser <- rnorm(2000)
FastApEn_C(timser)
FastApEn_C(timser, r = 0.1*sd(timser))
FastApEn_C(timser, dim = 3, r = 0.1*sd(timser))




