library(Dowd)


### Name: tVaRPlot2DCL
### Title: Plots t VaR against confidence level
### Aliases: tVaRPlot2DCL

### ** Examples

# Plots VaR against confidene level given P/L data data
   data <- runif(5, min = 0, max = .2)
   tVaRPlot2DCL(returns = data, df = 6, cl = seq(.85,.99,.01), hp = 60)

   # Computes VaR against confidence level given mean and standard deviation of P/L data
   tVaRPlot2DCL(mu = .012, sigma = .03, df = 6, cl = seq(.85,.99,.01), hp = 40)



