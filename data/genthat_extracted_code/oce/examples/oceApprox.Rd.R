library(oce)


### Name: oceApprox
### Title: Interpolate 1D Data with UNESCO or Reiniger-Ross Algorithm
### Aliases: oceApprox oce.approx

### ** Examples


library(oce)
if (require(ocedata)) {
    data(RRprofile)
    zz <- seq(0, 2000, 2)
    plot(RRprofile$temperature, RRprofile$depth, ylim=c(500, 0), xlim=c(2, 11))
    ## Contrast two methods
    a1 <- oce.approx(RRprofile$depth, RRprofile$temperature, zz, "rr")
    a2 <- oce.approx(RRprofile$depth, RRprofile$temperature, zz, "unesco")
    lines(a1, zz)
    lines(a2, zz, col='red')
    legend("bottomright",lwd=1,col=1:2, legend=c("rr","unesco"),cex=3/4)
}



