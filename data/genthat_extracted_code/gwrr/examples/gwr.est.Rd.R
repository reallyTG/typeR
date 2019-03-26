library(gwrr)


### Name: gwr.est
### Title: Geographically weighted regression
### Aliases: gwr.est
### Keywords: models

### ** Examples

data(columbus)
locs <- cbind(columbus$x, columbus$y)
col.gwr <- gwr.est(crime ~ income + houseval, locs, columbus, "exp")
plot(col.gwr$beta[2,], col.gwr$beta[3,])
plot(columbus$x, columbus$y, cex=col.gwr$beta[1,]/10)



