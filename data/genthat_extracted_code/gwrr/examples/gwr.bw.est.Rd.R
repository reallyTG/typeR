library(gwrr)


### Name: gwr.bw.est
### Title: Cross-validation estimation of kernel bandwidth
### Aliases: gwr.bw.est
### Keywords: models

### ** Examples

data(columbus)
locs <- cbind(columbus$x, columbus$y)
col.bw <- gwr.bw.est(crime ~ income + houseval, locs, columbus, "exp")
col.gwr <- gwr.est(crime ~ income + houseval, locs, columbus, "exp", bw=col.bw$phi)



