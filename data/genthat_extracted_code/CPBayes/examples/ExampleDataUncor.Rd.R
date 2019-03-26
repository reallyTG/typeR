library(CPBayes)


### Name: ExampleDataUncor
### Title: An example data for uncorrelated summary statistics.
### Aliases: ExampleDataUncor
### Keywords: datasets

### ** Examples

data(ExampleDataUncor)
BetaHat <- ExampleDataUncor$BetaHat
BetaHat
SE <- ExampleDataUncor$SE
SE
## No test: 
cpbayes_uncor(BetaHat, SE)
## End(No test)



