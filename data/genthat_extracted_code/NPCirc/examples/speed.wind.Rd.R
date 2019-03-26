library(NPCirc)


### Name: speed.wind
### Title: Wind speed and wind direction data
### Aliases: speed.wind speed.wind2
### Keywords: datasets

### ** Examples

data(speed.wind2)

# Density
dir <- circular(speed.wind2$Direction, units="degrees", template="geographics")
plot(dir, stack=TRUE,  shrink= 1.1)
rose.diag(dir, bins=16, add=TRUE)
lines(kern.den.circ(dir,bw=1), lwd=2, col=2)
lines(kern.den.circ(dir,bw=10), lwd=2, col=3)
lines(kern.den.circ(dir,bw=40), lwd=2, col=4)

# Regression
vel <- speed.wind2$Speed
nas <- which(is.na(vel))
dir <- dir[-nas]
vel <- vel[-nas]
res<-plot(kern.reg.circ.lin(dir, vel, bw=1, method="LL"), plot.type="circle", 
points.plot=TRUE, line.col=2, lwd=2, main="")
lines(kern.reg.circ.lin(dir, vel, bw=10, method="LL"), plot.type="circle", plot.info=res,
line.col=3, lwd=2)
lines(kern.reg.circ.lin(dir, vel, bw=40, method="LL"), plot.type="circle", plot.info=res, 
line.col=4, lwd=2)



