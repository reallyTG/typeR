library(Dowd)


### Name: NormalVaRPlot2DCL
### Title: Plots normal VaR against confidence level
### Aliases: NormalVaRPlot2DCL

### ** Examples

# Plots VaR against confidene level given P/L data
   data <- runif(5, min = 0, max = .2)
   NormalVaRPlot2DCL(returns = data, cl = seq(.85,.99,.01), hp = 60)

   # Computes VaR against confidence level given mean and standard deviation of return data
   NormalVaRPlot2DCL(mu = .012, sigma = .03, cl = seq(.85,.99,.01), hp = 40)



