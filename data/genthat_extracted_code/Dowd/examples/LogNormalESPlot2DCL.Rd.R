library(Dowd)


### Name: LogNormalESPlot2DCL
### Title: Plots log normal ES against confidence level
### Aliases: LogNormalESPlot2DCL

### ** Examples

# Plots ES against confidence level
   data <- runif(5, min = 0, max = .2)
   LogNormalESPlot2DCL(returns = data, investment = 5,
                       cl = seq(.9,.99,.01), hp = 60)

   # Plots ES against confidence level
   LogNormalESPlot2DCL(mu = .012, sigma = .03, investment = 5,
                       cl = seq(.9,.99,.01), hp = 40)



