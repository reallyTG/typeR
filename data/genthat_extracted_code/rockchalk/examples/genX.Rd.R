library(rockchalk)


### Name: genX
### Title: Generate correlated data (predictors) for one unit
### Aliases: genX

### ** Examples

X1 <- genX(10, means = c(7, 8), sds = 3, rho = .4)
X2 <- genX(10, means = c(7, 8), sds = 3, rho = .4, unit = "Kansas")
head(X2)
X3 <- genX(10, means = c(7, 8), sds = 3, rho = .4, idx = FALSE, unit = "Iowa")
head(X3)
X4 <- genX(10, means = c("A" = 7, "B" = 8), sds = c(3), rho = .4)
head(X4)
X5 <- genX(10, means = c(7, 3, 7, 5), sds = c(3, 6),
            rho = .5, col.names = c("Fred", "Sally", "Henry", "Barbi"))
head(X5)
Sigma <- lazyCov(Rho = c(.2, .3, .4, .5, .2, .1), Sd = c(2, 3, 1, 4))
X6 <- genX(10, means = c(5, 2, -19, 33), Sigma = Sigma, unit = "Winslow_AZ")
head(X6)




