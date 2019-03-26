library(MixGHD)


### Name: dMSGHD
### Title: Density of a mulitple-scaled generalized hyperbolic distribution
###   (MSGHD).
### Aliases: dMSGHD
### Keywords: Multiple-scaled Generalized hyperboilc distribution

### ** Examples




x = seq(-3,3,length.out=50)
y = seq(-3,3,length.out=50)
xyS1 = matrix(0,nrow=length(x),ncol=length(y))
for(i in 1:length(x)){
  for(j in 1:length(y)){
      xy <- matrix(cbind(x[i],y[j]),1,2)	
      xyS1[i,j] =  dMSGHD(xy,2) 
      
    }
  }
contour(x=x,y=y,z=xyS1, levels=seq(.005,.25,by=.005), main="MSGHD")




