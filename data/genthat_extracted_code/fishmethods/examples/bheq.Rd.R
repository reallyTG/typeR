library(fishmethods)


### Name: bheq
### Title: Length-based Beverton-Holt Equilibrium Total Instantaneous
###   Mortality Estimator
### Aliases: bheq
### Keywords: misc

### ** Examples
data(pinfish)
bheq(pinfish$sl,type=1,K=0.33,Linf=219.9,Lc=120,nboot=200)



