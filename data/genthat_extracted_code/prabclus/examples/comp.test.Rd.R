library(prabclus)


### Name: comp.test
### Title: Compare species clustering and species groups
### Aliases: comp.test
### Keywords: htest

### ** Examples

set.seed(1234)
g1 <- c(rep(1,34),rep(2,12),rep(3,15))
g2 <- sample(3,61,replace=TRUE)
comp.test(g1,g2)



