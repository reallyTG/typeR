library(TSEntropies)


### Name: SampEn
### Title: SampEn
### Aliases: SampEn
### Keywords: SampEn entropy sample

### ** Examples

timser <- rnorm(2000)
SampEn(timser)
SampEn(timser, r = 0.1*sd(timser))
SampEn(timser, dim = 3, r = 0.1*sd(timser))




