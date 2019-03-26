library(conclust)


### Name: conclust-package
### Title: Pairwise Constraints Clustering
### Aliases: conclust-package conclust
### Keywords: copkmeans mpckmeans lcvqe constraint clustering ccls local
###   search Tabu search

### ** Examples

data = matrix(c(0, 1, 1, 0, 0, 0, 1, 1), nrow = 4)
mustLink = matrix(c(1, 2), nrow = 1)
cantLink = matrix(c(1, 4), nrow = 1)
k = 2
pred = ckmeans(data, k, mustLink, cantLink)
pred
pred = mpckm(data, k, mustLink, cantLink)
pred
pred = lcvqe(data, k, mustLink, cantLink)
pred
pred = ccls(data, k, mustLink, cantLink)
pred



