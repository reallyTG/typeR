library(gamlss)


### Name: histDist
### Title: This function plots the histogram and a fitted (GAMLSS family)
###   distribution to a variable
### Aliases: histDist
### Keywords: regression

### ** Examples

data(abdom)
histDist(y,family="NO", data=abdom)
# use the ylim 
histDist(y,family="NO", ylim=c(0,0.005), data=abdom)
# bad fit use PE
histDist(y,family="PE",ymax=0.005, data=abdom, line.col="blue")
# discere data counts 
#  Hand at al. p150  Leptinotarsa decemlineata
y <- c(0,1,2,3,4,6,7,8,10,11)
freq <- c(33,12,5,6,5,2,2,2,1,2) 
histDist(y, "NBI", freq=freq)
# the same as 
histDist(rep(y,freq), "NBI")



