library(NPCirc)


### Name: lines.regression.circular
### Title: Add a plot for circular regression
### Aliases: lines.regression.circular
### Keywords: circular regression

### ** Examples

set.seed(1012)
n <- 100
x <- runif(100, 0, 2*pi)
y <- sin(x)+0.5*rnorm(n)
estNW<-kern.reg.circ.lin(circular(x),y,t=NULL,bw=10,method="NW")
estLL<-kern.reg.circ.lin(circular(x),y,t=NULL,bw=10,method="LL")
res<-plot(estNW, plot.type="circle", points.plot=TRUE)
lines(estLL, plot.type="circle",line.col=2, plot.info=res)



