library(Dowd)


### Name: LogNormalVaRPlot3D
### Title: Plots log normal VaR against confidence level and holding period
### Aliases: LogNormalVaRPlot3D

### ** Examples

# Plots VaR against confidene level given geometric return data
   data <- rnorm(5, .09, .03)
   LogNormalVaRPlot3D(returns = data, investment = 5, cl = seq(.9,.99,.01), hp = 1:100)

   # Computes VaR against confidence level given mean and standard deviation of return data
   LogNormalVaRPlot3D(mu = .012, sigma = .03, investment = 5, cl = seq(.9,.99,.01), hp = 1:100)



