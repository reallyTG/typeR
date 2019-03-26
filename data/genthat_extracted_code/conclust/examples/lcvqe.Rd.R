library(conclust)


### Name: lcvqe
### Title: LCVQE algorithm
### Aliases: lcvqe
### Keywords: lcvqe constraint clustering

### ** Examples

data = matrix(c(0, 1, 1, 0, 0, 0, 1, 1), nrow = 4)
mustLink = matrix(c(1, 2), nrow = 1)
cantLink = matrix(c(1, 4), nrow = 1)
k = 2
pred = lcvqe(data, k, mustLink, cantLink)
pred



