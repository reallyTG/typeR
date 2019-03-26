library(CPBayes)


### Name: ExampleDataCor
### Title: An example data for correlated summary statistics.
### Aliases: ExampleDataCor
### Keywords: datasets

### ** Examples

data(ExampleDataCor)
BetaHat <- ExampleDataCor$BetaHat
BetaHat
SE <- ExampleDataCor$SE
SE
cor <- ExampleDataCor$cor
cor
## No test: 
cpbayes_cor(BetaHat, SE, cor)
## End(No test)



