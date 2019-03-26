library(reliaR)


### Name: ks.exp.power
### Title: Test of Kolmogorov-Smirnov for the Exponential Power(EP)
###   distribution
### Aliases: ks.exp.power
### Keywords: htest

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## alpha.est = 0.905868898, lambda.est =  0.001531423

ks.exp.power(sys2, 0.905868898, 0.001531423, alternative = "two.sided", plot = TRUE) 




