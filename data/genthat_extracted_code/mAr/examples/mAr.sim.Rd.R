library(mAr)


### Name: mAr.sim
### Title: Simulation from a multivariate AR(p) model
### Aliases: mAr.sim
### Keywords: multivariate

### ** Examples

w=c(0.25,0.1)
C=rbind(c(1,0.5),c(0.5,1.5))
A=rbind(c(0.4,1.2,0.35,-0.3),c(0.3,0.7,-0.4,-0.5))
x=mAr.sim(w,A,C,N=300)



