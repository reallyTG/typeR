library(fractalrock)


### Name: getPortfolioPrices
### Title: Generate portfolio prices using the fractal process
### Aliases: getPortfolioPrices getTradingDates
### Keywords: ts math

### ** Examples

  data(generators)
  ps <- getPortfolioPrices('IBM', '2009-02-24',obs=10,
    seeds=sampleInitiators, patterns=sampleGenerators)

  getTradingDates('2009-02-26', obs=10)



