library(logiBin)


### Name: binTest
### Title: Checking the performance of the bins created on test data
### Aliases: binTest

### ** Examples

b1 <- getBins(loanData, "bad_flag", c('LTV', 'balance'))
b2 <- binTest(b1, loanData[1:50,], "bad_flag", c('LTV', 'balance'))




