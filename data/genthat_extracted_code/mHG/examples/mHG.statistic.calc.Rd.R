library(mHG)


### Name: mHG.statistic.calc
### Title: Calculate the minimum-hypergeometric (mHG) statistic.
### Aliases: mHG.statistic.calc

### ** Examples

N <- 50
B <- 15
lambdas <- numeric(50)
lambdas[sample(N, B)] <- 1
mHG.statistic.info <- mHG.statistic.calc(lambdas)@mHG



