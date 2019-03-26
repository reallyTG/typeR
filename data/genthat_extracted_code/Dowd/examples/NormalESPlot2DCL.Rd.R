library(Dowd)


### Name: NormalESPlot2DCL
### Title: Plots normal ES against confidence level
### Aliases: NormalESPlot2DCL

### ** Examples

# Plots ES against confidence level
   data <- runif(5, min = 0, max = .2)
   NormalESPlot2DCL(returns = data, cl = seq(.9,.99,.01), hp = 60)

   # Plots ES against confidence level
   NormalESPlot2DCL(mu = .012, sigma = .03, cl = seq(.9,.99,.01), hp = 40)



