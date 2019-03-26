library(RelValAnalysis)


### Name: AtlasModel
### Title: Atlas Model
### Aliases: AtlasModel

### ** Examples

# Create an Atlas model of 100 stocks
model <- AtlasModel(n = 100, g = 0.001, sigma = 0.2)

# Simulate the Atlas model to get 5 years of monthly data
market <- SimMarketModel(model, n.years = 5, frequency = 12)



