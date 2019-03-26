library(logiBin)


### Name: manualSplit
### Title: Split a variable based on specified cuts
### Aliases: manualSplit

### ** Examples

b1 <- getBins(loanData, "bad_flag", c('age', 'score', 'balance'), minCr=0.8)
b1 <- manualSplit(b1, 'age', 'bad_flag', c(25,40,55), loanData)




