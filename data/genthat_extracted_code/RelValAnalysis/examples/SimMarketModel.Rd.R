library(RelValAnalysis)


### Name: SimMarketModel
### Title: Simulating a Market Model
### Aliases: SimMarketModel

### ** Examples

# Create an Atlas model of 5 stocks
model <- AtlasModel(n = 5, g = 0.05, sigma = 0.1)

# Simulate the model to get 20 years of monthly data
# with initial weights c(0.1, 0.2, 0.2, 0.2, 0.3)
market <- SimMarketModel(model, n.years = 20, 
                          initial.weight = c(0.1, 0.2, 0.2, 0.2, 0.3), 
                          frequency = 12)
plot(market)



