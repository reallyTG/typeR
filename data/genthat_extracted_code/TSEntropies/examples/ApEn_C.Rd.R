library(TSEntropies)


### Name: ApEn_C
### Title: ApEn_C
### Aliases: ApEn_C
### Keywords: ApEn C approximate entropy

### ** Examples

timser <- rnorm(2000)
ApEn_C(timser)
ApEn_C(timser, r = 0.1*sd(timser))
ApEn_C(timser, dim = 3, r = 0.1*sd(timser))




