library(remote)


### Name: geoWeight
### Title: Geographic weighting
### Aliases: geoWeight

### ** Examples

data(vdendool)

wgtd <- geoWeight(vdendool)

opar <- par(mfrow = c(1,2))
plot(vdendool[[1]], main = "original")
plot(wgtd[[1]], main = "weighted")
par(opar)



