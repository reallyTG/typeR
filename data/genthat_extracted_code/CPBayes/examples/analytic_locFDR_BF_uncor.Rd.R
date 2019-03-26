library(CPBayes)


### Name: analytic_locFDR_BF_uncor
### Title: Analytic calculation of the local FDR & Bayes factor for
###   uncorrelated summary statistics.
### Aliases: analytic_locFDR_BF_uncor

### ** Examples

data(ExampleDataUncor)
BetaHat <- ExampleDataUncor$BetaHat
BetaHat
SE <- ExampleDataUncor$SE
SE
result <- analytic_locFDR_BF_uncor(BetaHat, SE)
str(result)




