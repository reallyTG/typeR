library(Dowd)


### Name: LogtVaRPlot3D
### Title: Plots log-t VaR against confidence level and holding period
### Aliases: LogtVaRPlot3D

### ** Examples

# Plots VaR against confidene level given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogtVaRPlot3D(returns = data, investment = 5, df = 6, cl = seq(.9,.99,.01), hp = 1:100)

   # Computes VaR against confidence level given mean and standard deviation of return data
   LogtVaRPlot3D(mu = .012, sigma = .03, investment = 5, df = 6, cl = seq(.9,.99,.01), hp = 1:100)



