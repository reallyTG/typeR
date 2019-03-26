library(ExcessMass)


### Name: exmplot
### Title: Excess Mass Lambda Plot
### Aliases: exmplot
### Keywords: hplot htest univ nonparametric

### ** Examples

library(MASS)
attach(geyser)

##calculating the maximal excess mass difference for duration of 'Old Faithful Geyser' for M=3
exmplot(duration, M=3)

##Plotting the excess mass against lambda for modes 1-5, 
##increase CutOff value, double the number of steps
exmplot(duration, M=5, CutOff=1.2, steps=100)

##Specifying Lambda
Lambda=seq(.0,0.5,0.005)
exmplot(duration, M=7, Lambda=Lambda)



