library(ExcessMass)


### Name: exmsilhouette
### Title: (Single) Excess Mass Silhouette
### Aliases: exmsilhouette colorizing
### Keywords: hplot htest univ nonparametric

### ** Examples

library(MASS)
attach(geyser)

##Plot allowing for up to two modes and reduced CutOff value
exmsilhouette(duration, M=2, CutOff=1.25)

##Plot with twice the default number of steps, omitting rug plot, 
##colorizing the graph and asking for numerical output
res <- exmsilhouette(duration, M=2, CutOff=1.25, steps=100, rug=FALSE, col=TRUE, rdata=TRUE)

##Specifying Lambda and requesting numerical output
L=seq(.01,0.25,0.005)
res <- exmsilhouette(duration, M=3, Lambda=L, col=TRUE, rdata=TRUE)



