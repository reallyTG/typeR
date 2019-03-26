library(SpatialEpi)


### Name: GammaPriorCh
### Title: Compute Parameters to Calibrate a Gamma Distribution
### Aliases: GammaPriorCh
### Keywords: file

### ** Examples

param <- GammaPriorCh(5, 0.975,1)
curve(dgamma(x,shape=param$a,rate=param$b),from=0,to=6,n=1000,ylab="density")



