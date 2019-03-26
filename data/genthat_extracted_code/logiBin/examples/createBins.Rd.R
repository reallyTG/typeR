library(logiBin)


### Name: createBins
### Title: Add binned variables to data
### Aliases: createBins

### ** Examples

b1 <- getBins(loanData, "bad_flag", c('age', 'score', 'balance'), minCr=0.8)
loanData <- createBins(b1, loanData, c('age', 'balance'))




