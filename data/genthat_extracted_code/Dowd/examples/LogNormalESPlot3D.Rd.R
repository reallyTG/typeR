library(Dowd)


### Name: LogNormalESPlot3D
### Title: Plots log normal ES against confidence level and holding period
### Aliases: LogNormalESPlot3D

### ** Examples

# Plots VaR against confidene level given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogNormalESPlot3D(returns = data, investment = 5, cl = seq(.9,.99,.01), hp = 1:100)

   # Computes VaR against confidence level given mean and standard deviation of return data
   LogNormalESPlot3D(mu = .012, sigma = .03, investment = 5, cl = seq(.9,.99,.01), hp = 1:100)



