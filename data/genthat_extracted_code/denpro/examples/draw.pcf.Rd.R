library(denpro)


### Name: draw.pcf
### Title: Prepares the plotting of a 2D or 1D piecewise constant function
### Aliases: draw.pcf
### Keywords: hplot

### ** Examples

# 2D case
dendat<-sim.data(n=100,type="mulmod")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))

dp<-draw.pcf(pcf,pnum=c(30,30))

contour(dp$x,dp$y,dp$z,drawlabels=FALSE)

persp(dp$x,dp$y,dp$z)

# 1D case
set.seed(1)
dendat<-matrix(rnorm(20),20)   #10*1 data-matrix
pcf<-pcf.kern(dendat,h=1,N=c(25))

dp<-draw.pcf(pcf)

plot(dp$x,dp$y,type="l")




