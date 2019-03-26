library(balance)


### Name: balance.plot
### Title: Calculate and Visualize Balances
### Aliases: balance.plot

### ** Examples

library(balance)
data(iris)
x <- iris[,1:4]
sbp <- sbp.fromPBA(x)
balance(x, sbp)




