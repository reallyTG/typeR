library(Dowd)


### Name: LogNormalVaRETLPlot2DCL
### Title: Plots log normal VaR and ETL against confidence level
### Aliases: LogNormalVaRETLPlot2DCL

### ** Examples

# Plots VaR and ETL against confidene level given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogNormalVaRETLPlot2DCL(returns = data, investment = 5, cl = seq(.85,.99,.01), hp = 60)

   # Computes VaR against confidence level given mean and standard deviation of return data
   LogNormalVaRETLPlot2DCL(mu = .012, sigma = .03, investment = 5, cl = seq(.85,.99,.01), hp = 40)



