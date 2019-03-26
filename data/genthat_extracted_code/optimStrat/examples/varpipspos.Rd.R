library(optimStrat)


### Name: varpipspos
### Title: Design variance of a PIps-pos sampling strategy.
### Aliases: varpipspos
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) ) #simulating the auxiliary variable
postst1<- stratify(x^1.25,H=6)
y<- simulatey(x,b0=10,b1=1,b2=1.25,b4=0.75,rho=0.95)
varpipspos(y, x_des=x^0.75, n=500, poststratum=postst1)



