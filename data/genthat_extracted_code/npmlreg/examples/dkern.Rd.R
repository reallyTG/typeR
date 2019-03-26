library(npmlreg)


### Name: dkern
### Title: Aitchison-Aitken kernel
### Aliases: dkern
### Keywords: models regression

### ** Examples


k<-6; 
dkern(1:k,4,k,0.99)   
# Kernel centered at the 4th component with a very small amount of smoothing.


## The function is currently defined as
function(x,y,k,lambda){
ifelse(y==x, lambda, (1-lambda)/(k-1))
  }



