library(Dowd)


### Name: tVaRPlot3D
### Title: Plots t VaR against confidence level and holding period
### Aliases: tVaRPlot3D

### ** Examples

# Plots VaR against confidene level given geometric return data
   data <- runif(5, min = 0, max = .2)
   tVaRPlot3D(returns = data, df = 6, cl = seq(.85,.99,.01), hp = 60:90)

   # Computes VaR against confidence level given mean and standard deviation of return data
   tVaRPlot3D(mu = .012, sigma = .03, df = 6, cl = seq(.85,.99,.02), hp = 40:80)



