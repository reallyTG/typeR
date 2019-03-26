library(TSEntropies)


### Name: FastSampEn
### Title: FastSampEn
### Aliases: FastSampEn
### Keywords: FastSampEn entropy fast sample

### ** Examples

timser <- rnorm(2000)
FastSampEn(timser)
FastSampEn(timser, r = 0.1*sd(timser))
FastSampEn(timser, dim = 3, r = 0.1*sd(timser))




