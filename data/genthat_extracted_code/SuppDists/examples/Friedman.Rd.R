library(SuppDists)


### Name: Friedman
### Title: Friedman's chi-square
### Aliases: dFriedman pFriedman qFriedman rFriedman sFriedman
### Keywords: distribution

### ** Examples


pFriedman(2, r=5, N=10)
pFriedman(c(.8,3.5,9.3), r=5, N=10) ## approximately 5% 50% and 95%
sFriedman(r=5, N=10)
plot(function(x)dFriedman(x, r=5, N=10),0,10)





