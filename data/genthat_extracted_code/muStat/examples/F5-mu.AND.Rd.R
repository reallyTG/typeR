library(muStat)


### Name: mu.AND
### Title: Pairwise AND
### Aliases: mu.AND
### Keywords: multivariate

### ** Examples

mu.AND(mu.GE(matrix(1:60, , 3)))
a.1 <- 1:10
a.2 <- 3:12
b <- c(1:5,2:6)
mu.AND(mu.GE(cbind(a.1,a.2,b)), frml="((1,2),3)")



