library(balance)


### Name: wide2long
### Title: Make Long Data from Wide Data
### Aliases: wide2long

### ** Examples

library(balance)
data(iris)
x <- iris[,1:4]
sbp <- sbp.fromPBA(x)
wide2long(sbp)




