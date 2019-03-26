library(SurrogateTest)


### Name: delta.estimate
### Title: Calculates the treatment effect, the difference in survival at
###   time t
### Aliases: delta.estimate
### Keywords: univar nonparametric survival

### ** Examples

data(dataA)
delta.estimate(xone = dataA$x1, xzero = dataA$x0, deltaone = dataA$delta1, deltazero = 
dataA$delta0, t=1)

delta.estimate(xone = dataA$x1, xzero = dataA$x0, deltaone = dataA$delta1, deltazero = 
dataA$delta0, t=0.5)




