library(FDGcopulas)


### Name: FDGcopula
### Title: Construction of FDG copula class object
### Aliases: FDGcopula

### ** Examples

## Create a FDG copula with Cuadras-Aug\'e generators
## and parameter vector 'theta'
theta <- c(.3,.5,.7,.9)
myFDGcopula <- FDGcopula("cuadrasauge", theta)
str(myFDGcopula)

## Create its extreme-value limit copula
myExtremeValueFDGcopula <- FDGcopula("cuadrasauge", theta,
extremevalue=TRUE)
str(myExtremeValueFDGcopula)

## Note: the two above copulas are NOT the same!



