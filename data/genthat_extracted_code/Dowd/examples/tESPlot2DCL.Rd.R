library(Dowd)


### Name: tESPlot2DCL
### Title: Plots t- ES against confidence level
### Aliases: tESPlot2DCL

### ** Examples

# Computes ES given geometric return data
   data <- runif(5, min = 0, max = .2)
   tESPlot2DCL(returns = data, df = 6, cl = seq(.9,.99,.01), hp = 60)

   # Computes v given mean and standard deviation of return data
   tESPlot2DCL(mu = .012, sigma = .03, df = 6, cl = seq(.9,.99,.01), hp = 40)



