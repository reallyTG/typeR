library(modehunt)


### Name: cvModeBlock
### Title: Critical values for test statistic based on the block procedure
### Aliases: cvModeBlock
### Keywords: datasets

### ** Examples

## extract critical values for alpha = 0.05, n = 200
data(cvModeBlock)
cv <- cvModeBlock[cvModeBlock$alpha == 0.05 & cvModeBlock$n == 200, 3:11]
cv



