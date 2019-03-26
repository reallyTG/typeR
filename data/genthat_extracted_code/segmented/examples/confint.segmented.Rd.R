library(segmented)


### Name: confint.segmented
### Title: Confidence intervals for breakpoints
### Aliases: confint.segmented
### Keywords: regression nonlinear

### ** Examples

set.seed(10)
x<-1:100
z<-runif(100)
y<-2+1.5*pmax(x-35,0)-1.5*pmax(x-70,0)+10*pmax(z-.5,0)+rnorm(100,0,2)
out.lm<-lm(y~x)
o<-segmented(out.lm,seg.Z=~x+z,psi=list(x=c(30,60),z=.4))
confint(o)



