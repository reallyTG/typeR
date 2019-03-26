library(Dowd)


### Name: LogtESPlot2DCL
### Title: Plots log-t ES against confidence level
### Aliases: LogtESPlot2DCL

### ** Examples

# Computes ES given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogtESPlot2DCL(returns = data, investment = 5, df = 6, cl = seq(.9,.99,.01), hp = 60)

   # Computes v given mean and standard deviation of return data
   LogtESPlot2DCL(mu = .012, sigma = .03, investment = 5, df = 6, cl = seq(.9,.99,.01), hp = 40)



