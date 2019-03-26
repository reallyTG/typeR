library(balance)


### Name: bplot-class
### Title: A pba model S4 class
### Aliases: bplot-class show,bplot-method [[,bplot-method

### ** Examples

library(balance)
data(iris)
x <- iris[,1:4]
sbp <- sbp.fromPBA(x)
balance(x, sbp)




