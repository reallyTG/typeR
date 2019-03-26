library(delt)


### Name: eval.stage.gauss
### Title: Returns a 1D Gaussian mixture density estimate
### Aliases: eval.stage.gauss
### Keywords: smooth

### ** Examples

library(denpro)
dendat<-sim.data(n=100,type="1d2modal",seed=1) 

mugrid<-seq(-1,5,0.3)    # grid of mu-values
siggrid<-seq(0.2,2,0.2)  # grid of sigma-values
M<-17                     # number of mixture components
pcf<-eval.stage.gauss(dendat,M,mugrid,siggrid)

dp<-draw.pcf(pcf)
plot(dp$x,dp$y,type="l")

# draw the estimate with the help of package "denpro"
#N<-100
#pcf2<-pcf.func("mixt",N,sig=pcf$sigit,M=pcf$muut,p=pcf$curmix)  
#pnum<-100
#dm<-draw.pcf(pcf2,pnum=pnum) 
#plot(dm$x,dm$y,type="l")




