library(TSEntropies)


### Name: ApEn_R
### Title: ApEn_R
### Aliases: ApEn_R
### Keywords: ApEn R approximate entropy

### ** Examples

timser <- rnorm(2000)
ApEn_R(timser)
ApEn_R(timser, r = 0.1*sd(timser))
ApEn_R(timser, dim = 3, r = 0.1*sd(timser))




