library(ExcessMass)


### Name: mexmsilhouette
### Title: (Multiple) Excess Mass Silhouette
### Aliases: mexmsilhouette
### Keywords: hplot htest univ nonparametric

### ** Examples

library(MASS)
attach(geyser)

##calculating excess mass plots for duration of 'Old Faithful Geyser',
##specifying CutOff and number of steps manually
mexmsilhouette(duration, CutOff=c(1,2), steps=60)

##Allowing for three different maximal number of modes 
##and CutOff factors as well as color. 
##The rug plot is omitted and numerical data is requested.
res=mexmsilhouette(duration, M=c(2,3,7), CutOff=c(0.8,1,2), col=TRUE, rug=FALSE, rdata=TRUE)

##Lambda is specified, color is set to true, numerical data is requested
L=seq(.01,.25,0.005)
res=mexmsilhouette(duration, M=c(2,3,4), Lambda=L, col=TRUE, rdata=TRUE)



