library(optimStrat)


### Name: varpipsreg
### Title: Design variance of a PIps-reg sampling strategy.
### Aliases: varpipsreg
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) ) #simulating the auxiliary variable
y<- simulatey(x,b0=10,b1=1,b2=1.25,b4=0.75,rho=0.95)
varpipsreg(y, x_des=x^0.75, n=500, x_est=x^1.25)



