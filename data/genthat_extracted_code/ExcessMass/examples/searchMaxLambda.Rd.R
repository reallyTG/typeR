library(ExcessMass)


### Name: searchMaxLambda
### Title: Searching For A Maximal Lambda
### Aliases: searchMaxLambda
### Keywords: htest

### ** Examples

library(MASS)
attach(geyser)

#Calculating Lambda using standard settings
searchMaxLambda(duration)

#Calculating Lambda, reducing cut off value and step. Setting another initial lambda
searchMaxLambda(duration, limcount = 5, step = 1.01, trylambda = 1)



