library(rockchalk)


### Name: genCorrelatedData
### Title: Generates a data frame for regression analysis
### Aliases: genCorrelatedData

### ** Examples

## 1000 observations of uncorrelated x1 and x2 with no
## interaction between x1 and x2
dat <- genCorrelatedData(N=1000, rho=0, beta=c(1, 1.0, -1.1, 0.0))
  mcGraph1(dat$x1, dat$x2, dat$y, theta=20, phi=8,
  ticktype="detailed", nticks=10)
m1 <- lm(y ~ x1 + x2, data = dat)
plotPlane(m1, plotx1 = "x1", plotx2 = "x2")




