library(RelValAnalysis)


### Name: EnergyEntropyDecomp
### Title: Energy-entropy Decomposition
### Aliases: EnergyEntropyDecomp

### ** Examples

# Example 1
# Energy-entropy decomposition for the entropy-weighted portfolio
data(applestarbucks)
market <- toymkt(applestarbucks, initial.weight = c(0.5, 0.5))
weight <- GetWeight(market, EntropyPortfolio$weight.function)
decomp <- EnergyEntropyDecomp(market, weight, plot = TRUE)


# Example 2
# Example of a hierchical decomposition of the entropy-weighted
# portfolio in the Atlas market model
model <- AtlasModel(n = 6, g = 0.1, sigma = 0.2)
market <- SimMarketModel(model)  # default settings
grouping <- c(1, 1, 2, 2, 2, 2)
weight <- GetWeight(market, EntropyPortfolio$weight.function)
decomp <- EnergyEntropyDecomp(market, weight, grouping, plot = TRUE)



