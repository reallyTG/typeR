library(oce)


### Name: ctdDecimate
### Title: Decimate a CTD profile
### Aliases: ctdDecimate

### ** Examples

library(oce)
data(ctd)
plotProfile(ctd, "salinity", ylim=c(10, 0))
p <- seq(0, 45, 1)
ctd2 <- ctdDecimate(ctd, p=p)
lines(ctd2[["salinity"]], ctd2[["pressure"]], col="blue")
p <- seq(0, 45, 1)
ctd3 <- ctdDecimate(ctd, p=p, method=function(x, y, xout)
                    predict(smooth.spline(x, y, df=30), xout)$y)
lines(ctd3[["salinity"]], ctd3[["pressure"]], col="red")





