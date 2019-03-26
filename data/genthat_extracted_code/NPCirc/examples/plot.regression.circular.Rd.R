library(NPCirc)


### Name: plot.regression.circular
### Title: Plot circular regression
### Aliases: plot.regression.circular
### Keywords: circular regression

### ** Examples

set.seed(1012)
n <- 100
x <- runif(100, 0, 2*pi)
y <- sin(x)+0.5*rnorm(n)
estNW<-kern.reg.circ.lin(circular(x),y,t=NULL,bw=10,method="NW")
plot(estNW, plot.type="line", points.plot=TRUE)
plot(estNW, plot.type="circle", points.plot=TRUE)



