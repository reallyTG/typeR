library(NPCirc)


### Name: kern.reg.circ.lin
### Title: Nonparametric regression estimation for circular data
### Aliases: kern.reg.circ.lin kern.reg.circ.circ kern.reg.lin.circ
###   print.regression.circular
### Keywords: circular regression

### ** Examples

### circular-linear
data(speed.wind2)
dir <- speed.wind2$Direction
vel <- speed.wind2$Speed
nas <- which(is.na(vel))
dir <- circular(dir[-nas],units="degrees")
vel <- vel[-nas]
estLL <- kern.reg.circ.lin(dir, vel, method="LL")
estNW <- kern.reg.circ.lin(dir, vel, method="NW")
# Circular representation
res<-plot(estNW, plot.type="circle", points.plot=TRUE,
labels=c("N","NE","E","SE","S","SO","O","NO"),
label.pos=seq(0,7*pi/4,by=pi/4), zero=pi/2, clockwise=TRUE)
lines(estLL, plot.type="circle", plot.info=res, line.col=2)
# Linear representation
plot(estNW, plot.type="line", points.plot=TRUE, xlab="direction", ylab="speed (m/s)")
lines(estLL, plot.type="line", line.col=2)


### circular-circular
data(wind)
wind6 <- circular(wind$wind.dir[seq(7,1752,by=24)])
wind12 <- circular(wind$wind.dir[seq(13,1752,by=24)])
estNW <- kern.reg.circ.circ(wind6,wind12,t=NULL,bw=6.1,method="NW")
estLL <- kern.reg.circ.circ(wind6,wind12,t=NULL,bw=2.25,method="LL")
# Torus representation
plot(estNW, plot.type="circle", points.plot=TRUE, line.col=2, lwd=2, points.col=2, 
units="degrees")
lines(estLL, plot.type="circle", line.col=3, lwd=2)
# Linear representation
plot(estNW, plot.type="line", points.plot=TRUE, xlab="Wind direction at 6 a.m.", 
ylab="Wind direction at noon")
lines(estLL, plot.type="line", line.col=2)


### linear-circular
data(periwinkles)
dist <- periwinkles$distance
dir <- circular(periwinkles$direction, units="degrees")
estNW <- kern.reg.lin.circ(dist,dir,t=NULL,bw=12.7,method="NW")
estLL <- kern.reg.lin.circ(dist,dir,t=NULL,bw=200,method="LL")
# Cylinder representation
plot(estNW, plot.type="circle", points.plot=TRUE, line.col=2, lwd=2, points.col=2)
lines(estLL, plot.type="circle", line.col=3, lwd=2)
# Linear representation
plot(estNW, plot.type="line", points.plot=TRUE, units="radians", main="")
lines(estLL, plot.type="line", line.col=2, units="radians")



