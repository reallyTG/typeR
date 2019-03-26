library(UtilityFrailtyPH12)


### Name: GetPriors
### Title: Returns prior dose-specific means.
### Aliases: GetPriors

### ** Examples

library(mvtnorm)
PROBST=c(.05,.10,.15,.20,.30)
PROBSE=c(.2,.4,.6,.65,.7)
Var=1
HypVar=36
tau=1
B=100
Z=GetPriors(PROBST,PROBSE,Var,HypVar,tau,B)



