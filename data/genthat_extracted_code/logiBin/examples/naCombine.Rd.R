library(logiBin)


### Name: naCombine
### Title: Combine NA bins
### Aliases: naCombine

### ** Examples

b1 <- getBins(loanData, "bad_flag", c('age', 'score', 'LTV'))
b1 <- naCombine(b1, c('LTV'))




