library(HiClimR)


### Name: minSigCor
### Title: Minimum significant correlation for a sample size
### Aliases: minSigCor
### Keywords: HiClimR

### ** Examples

require(HiClimR)

## Find minimum significant correlation at 95% confidence level
rMin <- minSigCor(n = 41, alpha = 0.05, r = seq(0, 1, by = 1e-06))



