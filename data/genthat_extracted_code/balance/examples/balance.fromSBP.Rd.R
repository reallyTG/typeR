library(balance)


### Name: balance.fromSBP
### Title: Compute Balances from an SBP Matrix
### Aliases: balance.fromSBP

### ** Examples

library(balance)
data(iris)
x <- iris[,1:4]
sbp <- sbp.fromPBA(x)
balance.fromSBP(x, sbp)




