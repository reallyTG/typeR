library(kdevine)


### Name: kdevinecop
### Title: Kernel estimation of vine copula densities
### Aliases: kdevinecop

### ** Examples

data(wdbc, package = "kdecopula")
# rank-transform to copula data (margins are uniform)
u <- VineCopula::pobs(wdbc[, 5:7], ties = "average")
## Don't show: 
u <- u[1:30, ]
## End(Don't show)
fit <- kdevinecop(u)                   # estimate density
dkdevinecop(c(0.1, 0.1, 0.1), fit)     # evaluate density estimate
contour(fit)                           # contour matrix (Gaussian scale)
pairs(rkdevinecop(500, fit))           # plot simulated data




