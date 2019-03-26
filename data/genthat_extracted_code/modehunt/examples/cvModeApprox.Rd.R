library(modehunt)


### Name: cvModeApprox
### Title: Critical values for test statistic based on the approximating
###   set of intervals
### Aliases: cvModeApprox
### Keywords: datasets

### ** Examples

## extract critical values for alpha = 0.05, n = 200
data(cvModeApprox)
cv <- cvModeApprox[cvModeApprox$alpha == 0.05 & cvModeApprox$n == 200, 3:4]
cv



