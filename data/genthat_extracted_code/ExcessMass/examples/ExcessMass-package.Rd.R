library(ExcessMass)


### Name: ExcessMass
### Title: Excess Mass Calculation and Plots
### Aliases: ExcessMass-package ExcessMass
### Keywords: package

### ** Examples

library(MASS)
attach(geyser)
excessm(duration, lambda=0.2)

x <- rnorm(1000)
exmsilhouette(x, M=2, CutOff=0.5)

mexmsilhouette(duration, CutOff=c(1,2), steps=60)



