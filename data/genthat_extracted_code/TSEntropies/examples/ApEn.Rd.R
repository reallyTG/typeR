library(TSEntropies)


### Name: ApEn
### Title: ApEn
### Aliases: ApEn
### Keywords: ApEn approximate entropy

### ** Examples

timser <- rnorm(2000)
ApEn(timser)
ApEn(timser, r = 0.1*sd(timser))
ApEn(timser, dim = 3, r = 0.1*sd(timser))




