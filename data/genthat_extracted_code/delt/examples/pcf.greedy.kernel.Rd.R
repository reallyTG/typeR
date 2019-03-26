library(delt)


### Name: pcf.greedy.kernel
### Title: Computes a discretized kernel estimator with an adaptive
###   partition
### Aliases: pcf.greedy.kernel
### Keywords: multivariate smooth

### ** Examples

library(denpro)
# generate data
seed<-1
n<-50
d<-2
l<-3; D<-4; c<-D/sqrt(2)
M<-matrix(0,l,d); M[2,]<-c; M[3,]<--c
sig<-matrix(1,l,d)
p<-rep(1/l,l)
dendat<-sim.data(type="mixt",n=n,M=M,sig=sig,p=p,seed=seed)

# colored volume function 
h<-(4/(d+2))^(1/(d+4))*n^(-1/(d+4))*apply(dendat,2,sd)
minobs<-1
pcf<-pcf.greedy.kernel(dendat,h,minobs=minobs,type="greedy")
#lst<-leafsfirst.adagrid(pcf)
#plotvolu(lst,colo=TRUE)

#dp<-draw.pcf(pcf)
#contour(dp$x,dp$y,dp$z,drawlabels=FALSE)



