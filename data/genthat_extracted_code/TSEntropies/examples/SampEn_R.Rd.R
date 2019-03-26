library(TSEntropies)


### Name: SampEn_R
### Title: SampEn_R
### Aliases: SampEn_R
### Keywords: ApEn R approximate entropy

### ** Examples

timser <- rnorm(2000)
SampEn_R(timser)
SampEn_R(timser, r = 0.1*sd(timser))
SampEn_R(timser, dim = 3, r = 0.1*sd(timser))




