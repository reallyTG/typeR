library(optimStrat)


### Name: varstsireg
### Title: Design variance of a STSI-reg sampling strategy.
### Aliases: varstsireg
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) ) #simulating the auxiliary variable
strat1<- optiallo(n=150,x^0.75,H=6)
y<- simulatey(x,b0=10,b1=1,b2=1.25,b4=0.75,rho=0.95)
varstsireg(y, stratum=strat1$stratum,nh=strat1$nh,x=x^1.25)



