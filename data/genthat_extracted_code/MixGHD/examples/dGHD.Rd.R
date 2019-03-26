library(MixGHD)


### Name: dGHD
### Title: Density of a generalized hyperbolic distribution (GHD).
### Aliases: dGHD
### Keywords: Generalized hyperboilc distribution

### ** Examples




x = seq(-3,3,length.out=50)
y = seq(-3,3,length.out=50)
xyS1 = matrix(0,nrow=length(x),ncol=length(y))
for(i in 1:length(x)){
  for(j in 1:length(y)){
      xy <- matrix(cbind(x[i],y[j]),1,2)	
      xyS1[i,j] =  dGHD(xy,2) 
      
    }
  }
contour(x=x,y=y,z=xyS1, levels=c(.005,.01,.025,.05, .1,.25), main="MGHD",ylim=c(-3,3), xlim=c(-3,3))







