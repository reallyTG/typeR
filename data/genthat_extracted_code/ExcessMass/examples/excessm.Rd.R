library(ExcessMass)


### Name: excessm
### Title: Excess Mass Function
### Aliases: excessm localmax lambdaweight
### Keywords: htest univ nonparametric

### ** Examples

library(MASS)
attach(geyser)

##calculating excess mass for duration of 'Old Faithful Geyser' for lambda=0.2 allowing for one mode
excessm(duration, lambda=0.2)

##same as above, but allowing for up to three modes
excessm(duration, lambda=0.2, M=3) 

#returns the intervals for modes 1,2 and 3
excessm(duration, lambda=0.2, M=3, UpToM=TRUE) 



