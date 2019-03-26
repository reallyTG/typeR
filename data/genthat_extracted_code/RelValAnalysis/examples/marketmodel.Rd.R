library(RelValAnalysis)


### Name: marketmodel
### Title: Market Model Objects
### Aliases: marketmodel

### ** Examples

# Create a model of two independent geometric Brownian motions
model1 <- marketmodel(name = "GBM", n = 2,
                      gamma = c(0.1, 0.05),
                      diffmatrix = c(0.1, 0.2),
                      diag = TRUE)

# Create an Atlas model of 100 stocks
model2 <- AtlasModel(n = 100, g = 0.0001, sigma = 0.1)

# Create a Volatility stabilized market of 10 stocks
model3 <- VolStabModel(n = 10, alpha = 0.001, sigma = 0.01)



