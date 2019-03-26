library(Dowd)


### Name: tVaRESPlot2DCL
### Title: Plots t VaR and ES against confidence level
### Aliases: tVaRESPlot2DCL

### ** Examples

# Plots VaR and ETL against confidene level given P/L data
   data <- runif(5, min = 0, max = .2)
   tVaRESPlot2DCL(returns = data, df = 7, cl = seq(.85,.99,.01), hp = 60)

   # Computes VaR against confidence level given mean and standard deviation of P/L data
   tVaRESPlot2DCL(mu = .012, sigma = .03, df = 7, cl = seq(.85,.99,.01), hp = 40)



