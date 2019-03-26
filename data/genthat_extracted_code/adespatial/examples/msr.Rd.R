library(adespatial)


### Name: msr
### Title: Moran spectral randomization
### Aliases: msr msr.default
### Keywords: spatial

### ** Examples


library(spdep)
x1 <- matrix(rnorm(81*5), nrow = 81)
lw1 <- nb2listw(cell2nb(9, 9))

moran.mc(x1[,1], lw1, 2)$statistic

## singleton
x1.1 <- msr(x1[,1], lw1, nrepet = 9, method = "singleton")
apply(x1.1, 2, function(x) moran.mc(x, listw = lw1, nsim = 2)$statistic)

## triplet
x1.2 <- msr(x1[,1], lw1, nrepet = 9, method = "triplet")
apply(x1.2, 2, function(x) moran.mc(x, listw = lw1, nsim = 2)$statistic)

## pair
x1.3 <- msr(x1[,1], lw1, nrepet = 9, method = "pair")
apply(x1.3, 2, function(x) moran.mc(x, listw = lw1, nsim = 2)$statistic)

## pair with cor.fixed
x1.4 <- msr(x1[,1], lw1, nrepet = 9, cor.fixed = 0.5)
apply(x1.4, 2, function(x) moran.mc(x, listw = lw1, nsim = 2)$statistic)
cor(x1[,1], x1.4)

## pair preserving correlations for multivariate data
x1.5 <- msr(x1, lw1, nrepet = 9, cor.fixed = 0.5)
cor(x1)
lapply(x1.5, cor)

apply(x1, 2, function(x) moran.mc(x, listw = lw1, nsim = 2)$statistic)
apply(x1.5[[1]], 2, function(x) moran.mc(x, listw = lw1, nsim = 2)$statistic)

## singleton preserving correlations for multivariate data
x1.6 <- msr(x1, lw1, nrepet = 9, method = "singleton")
cor(x1)
lapply(x1.6, cor)

apply(x1, 2, function(x) moran.mc(x, listw = lw1, nsim = 2)$statistic)
apply(x1.6[[1]], 2, function(x) moran.mc(x, listw = lw1, nsim = 2)$statistic)




