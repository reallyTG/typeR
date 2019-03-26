library(modehunt)


### Name: cvModeAll
### Title: Critical values for test statistic based on all intervals
### Aliases: cvModeAll
### Keywords: datasets

### ** Examples

## extract critical values for alpha = 0.05, n = 200
data(cvModeAll)
cv <- cvModeAll[cvModeAll$alpha == 0.05 & cvModeAll$n == 200, 3:4]
cv



