library(gwrr)


### Name: gwrr-package
### Title: Geographically weighted regression models with penalties and
###   diagnostic tools
### Aliases: gwrr-package gwrr
### Keywords: package

### ** Examples

data(columbus)
locs <- cbind(columbus$x, columbus$y)
col.gwr <- gwr.est(crime ~ income + houseval, locs, columbus, "exp")
plot(col.gwr$beta[2,], col.gwr$beta[3,])
col.vdp <- gwr.vdp(crime ~ income + houseval, locs, columbus, col.gwr$phi, "exp")
hist(col.vdp$condition)



