library(metRology)


### Name: GUM.validate
### Title: Monte Carlo Check on the Statistical Performance of GUM
###   Uncertainty Intervals Using Attained Coverage Probability
### Aliases: GUM.validate
### Keywords: univar htest

### ** Examples

## a simple uncertainty analysis for the product of two quantities
GUM.validate(c("x1","x2"), c(2.3,1.1), c(0.030,0.015), c(5,9999),
               c("A","B"),c("Normal","Rectangular"),"x1*x2")



