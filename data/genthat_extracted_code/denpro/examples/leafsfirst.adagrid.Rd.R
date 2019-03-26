library(denpro)


### Name: leafsfirst.adagrid
### Title: Computes a level set tree of a discretized kernel estimator with
###   an adaptive grid
### Aliases: leafsfirst.adagrid
### Keywords: multivariate smooth

### ** Examples

# generate data
seed<-1
n<-50
d<-2
l<-3; D<-4; c<-D/sqrt(2)
M<-matrix(0,l,d); M[2,]<-c; M[3,]<--c
sig<-matrix(1,l,d)
p<-rep(1/l,l)
dendat<-sim.data(type="mixt",n=n,M=M,sig=sig,p=p,seed=seed)

h<-(4/(d+2))^(1/(d+4))*n^(-1/(d+4))*apply(dendat,2,sd)
minobs<-3
#pcf<-pcf.greedy.kernel(dendat,h,minobs=minobs,type="greedy")
#lst<-leafsfirst.adagrid(pcf)




