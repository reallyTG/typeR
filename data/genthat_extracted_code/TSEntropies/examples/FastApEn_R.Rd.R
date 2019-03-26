library(TSEntropies)


### Name: FastApEn_R
### Title: FastApEn_R
### Aliases: FastApEn_R
### Keywords: ApEn R approximate entropy

### ** Examples

timser <- rnorm(2000)
FastApEn_R(timser)
FastApEn_R(timser, r = 0.1*sd(timser))
FastApEn_R(timser, dim = 3, r = 0.1*sd(timser))




