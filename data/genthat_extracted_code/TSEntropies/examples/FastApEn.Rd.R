library(TSEntropies)


### Name: FastApEn
### Title: FastApEn
### Aliases: FastApEn
### Keywords: FastApEn approximate entropy fast

### ** Examples

timser <- rnorm(2000)
FastApEn(timser)
FastApEn(timser, r = 0.1*sd(timser))
FastApEn(timser, dim = 3, r = 0.1*sd(timser))




