library(Dowd)


### Name: LogtESPlot3D
### Title: Plots log-t ES against confidence level and holding period
### Aliases: LogtESPlot3D

### ** Examples

# Plots ES against confidene level given geometric return data
   data <- rnorm(5, .09, .03)
   LogtESPlot3D(returns = data, investment = 5, df = 6, cl = seq(.9,.99,.01), hp = 1:100)

   # Computes ES against confidence level given mean and standard deviation of return data
   LogtESPlot3D(mu = .012, sigma = .03, investment = 5, df = 6, cl = seq(.9,.99,.01), hp = 1:100)



