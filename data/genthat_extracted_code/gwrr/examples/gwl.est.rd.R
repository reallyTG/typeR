library(gwrr)


### Name: gwl.est
### Title: Geographically weighted lasso
### Aliases: gwl.est
### Keywords: models

### ** Examples

data(columbus)
locs <- cbind(columbus$x, columbus$y)
col.gwl <- gwl.est(crime ~ income + houseval, locs, columbus, "exp")
plot(col.gwl$beta[2,], col.gwl$beta[3,])
plot(columbus$x, columbus$y, cex=col.gwl$beta[1,]/10)



