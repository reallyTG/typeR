library(CPBayes)


### Name: analytic_locFDR_BF_cor
### Title: Analytic calculation of the local FDR & Bayes factor for
###   correlated summary statistics.
### Aliases: analytic_locFDR_BF_cor

### ** Examples

data(ExampleDataCor)
BetaHat <- ExampleDataCor$BetaHat
BetaHat
SE <- ExampleDataCor$SE
SE
cor <- ExampleDataCor$cor
cor
result <- cpbayes_cor(BetaHat, SE, cor)
str(result)




