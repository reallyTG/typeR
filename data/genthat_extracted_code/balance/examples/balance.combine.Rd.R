library(balance)


### Name: balance.combine
### Title: Combine Two Sub-Plots
### Aliases: balance.combine

### ** Examples

library(balance)
data(iris)
x <- iris[,1:4]
sbp <- sbp.fromPBA(x)
res <- balance(x, sbp)
custom1 <- res[[1]] + ggplot2::theme_dark()
custom2 <- res[[2]] + ggplot2::theme_dark()
balance.combine(custom1, custom2)




