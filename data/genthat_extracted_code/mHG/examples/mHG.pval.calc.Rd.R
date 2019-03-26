library(mHG)


### Name: mHG.pval.calc
### Title: Calculate the p-value of a minimum-hypergeometric (mHG)
###   statistic.
### Aliases: mHG.pval.calc
### Keywords: htest

### ** Examples

N <- 50
B <- 15
lambdas <- numeric(50)
lambdas[sample(N, B)] <- 1
p <- mHG.statistic.calc(lambdas)@mHG
p.corrected <- mHG.pval.calc(p, N, B) # Could have used mHG.test directly



