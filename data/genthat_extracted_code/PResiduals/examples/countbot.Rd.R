library(PResiduals)


### Name: countbot
### Title: Conditional count by ordinal tests for association.
### Aliases: countbot

### ** Examples

data(PResidData)
countbot(x|c ~z, fit.y="poisson",data=PResidData)
countbot(x|c ~z, fit.y="negative binomial",data=PResidData)



