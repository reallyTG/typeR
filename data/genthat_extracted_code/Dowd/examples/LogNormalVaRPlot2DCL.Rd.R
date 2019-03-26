library(Dowd)


### Name: LogNormalVaRPlot2DCL
### Title: Plots log normal VaR against confidence level
### Aliases: LogNormalVaRPlot2DCL

### ** Examples

# Plots VaR against confidene level given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogNormalVaRPlot2DCL(returns = data, investment = 5, cl = seq(.85,.99,.01), hp = 60)

   # Computes VaR against confidence level given mean and standard deviation of return data
   LogNormalVaRPlot2DCL(mu = .012, sigma = .03, investment = 5, cl = seq(.85,.99,.01), hp = 40)



