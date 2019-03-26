library(MixGHD)


### Name: dCGHD
### Title: Density of a coalesced generalized hyperbolic distribution
###   (MSGHD).
### Aliases: dCGHD
### Keywords: Coalesced Generalized hyperboilc distribution

### ** Examples




x = seq(-3,3,length.out=30)
y = seq(-3,3,length.out=30)
xyS1 = matrix(0,nrow=length(x),ncol=length(y))
for(i in 1:length(x)){
  for(j in 1:length(y)){
      xy <- matrix(cbind(x[i],y[j]),1,2)	
      xyS1[i,j] =  dCGHD(xy,2) 
      
    }
  }
contour(x=x,y=y,z=xyS1, levels=c(.005,.01,.025,.05, .1,.25), main="CGHD",ylim=c(-3,3), xlim=c(-3,3))





