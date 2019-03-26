library(TSEntropies)


### Name: SampEn_C
### Title: SampEn_C
### Aliases: SampEn_C
### Keywords: C SampEn entropy sample

### ** Examples

timser <- rnorm(2000)
SampEn_C(timser)
SampEn_C(timser, r = 0.1*sd(timser))
SampEn_C(timser, dim = 3, r = 0.1*sd(timser))




