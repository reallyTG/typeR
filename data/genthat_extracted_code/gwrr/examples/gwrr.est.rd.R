library(gwrr)


### Name: gwrr.est
### Title: Geographically weighted ridge regression
### Aliases: gwrr.est
### Keywords: models

### ** Examples

data(columbus)
locs <- cbind(columbus$x, columbus$y)
col.gwrr <- gwrr.est(crime ~ income + houseval, locs, columbus, "exp", bw=2.00, rd=0.03)
plot(col.gwrr$beta[2,], col.gwrr$beta[3,])
plot(columbus$x, columbus$y, cex=col.gwrr$beta[1,]/10)
col.gwr <- gwrr.est(crime ~ income + houseval, locs, columbus, "exp", bw=col.gwrr$phi, rd=0)



