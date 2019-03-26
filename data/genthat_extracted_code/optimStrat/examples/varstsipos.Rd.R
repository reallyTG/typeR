library(optimStrat)


### Name: varstsipos
### Title: Design variance of a STSI-pos sampling strategy.
### Aliases: varstsipos
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(5000, shape=4/9, scale=108) ) #simulating the auxiliary variable
strat1<- optiallo(n=150,x^0.75,H=6)
post1<- stratify(x^1.25,H=6)
y<- simulatey(x,b0=10,b1=1,b2=1.25,b4=0.75,rho=0.95)
varstsipos(y, stratum=strat1$stratum,nh=strat1$nh,poststratum=post1)



