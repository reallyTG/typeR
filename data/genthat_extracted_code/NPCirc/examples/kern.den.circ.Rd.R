library(NPCirc)


### Name: kern.den.circ
### Title: Nonparametric circular kernel density estimation
### Aliases: kern.den.circ
### Keywords: circular density

### ** Examples

set.seed(2012)
n <- 100
x <- rcircmix(n, model=14)
est1 <- kern.den.circ(x, t=NULL, bw=NULL)
plot(est1, plot.type="circle", points.plot=TRUE, shrink=1.2, main="Circular plot")
est2 <- kern.den.circ(x, t=NULL, bw=20)
lines(est2, plot.type="circle",shrink=1.2,col=2)
plot(est1, plot.type="line", main="Linear plot")
lines(est2, plot.type="line", col=2)



