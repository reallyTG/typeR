library(Dowd)


### Name: NormalVaRPlot3D
### Title: Plots normal VaR in 3D against confidence level and holding
###   period
### Aliases: NormalVaRPlot3D

### ** Examples

# Plots VaR against confidene level given geometric return data
   data <- rnorm(5, .07, .03)
   NormalVaRPlot3D(returns = data, cl = seq(.9,.99,.01), hp = 1:100)

   # Computes VaR against confidence level given mean and standard deviation of return data
   NormalVaRPlot3D(mu = .012, sigma = .03, cl = seq(.9,.99,.01), hp = 1:100)



