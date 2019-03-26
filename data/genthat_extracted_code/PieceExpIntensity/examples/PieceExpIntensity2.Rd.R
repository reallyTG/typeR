library(PieceExpIntensity)


### Name: PieceExpIntensity2
### Title: C++ Sampling Function for MCMC
### Aliases: PieceExpIntensity2

### ** Examples

B=1000
n=100
Y=rexp(n,1)
Rates=Y
Rates[Y<.5]=rpois(sum(Y<.5),20)
Rates[Y>.5]=rpois(sum(Y>.5),3)
Poi=10
PieceExpIntensity2(Y,Rates,B,Poi)



