library(ICSNP)


### Name: ind.ctest
### Title: Test of Independece based on Marginal Ranks
### Aliases: ind.ctest
### Keywords: htest multivariate nonparametric

### ** Examples

A1 <- matrix(c(4, 4, 5, 4, 6, 6, 5, 6, 7), ncol = 3)
A2 <- matrix(c(0.5, -0.3, -0.3, 0.7), ncol = 2)
X <- cbind(rmvnorm(100, c(-1, 0, 1), A1), rmvnorm(100, c(0, 0), A2))
ind.ctest(X,1:3)
ind.ctest(X, c(1, 5), c(2, 3), scores = "normal")



