library(gwrr)


### Name: gwr.vdp
### Title: Collinearity diagnostics for geographically weighted regression
### Aliases: gwr.vdp
### Keywords: multivariate

### ** Examples

data(columbus)
locs <- cbind(columbus$x, columbus$y)
col.bw <- gwr.bw.est(crime ~ income + houseval, locs, columbus, "exp")
col.vdp <- gwr.vdp(crime ~ income + houseval, locs, columbus, col.bw$phi, "exp")
hist(col.vdp$condition)



