library(Dowd)


### Name: NormalESPlot3D
### Title: Plots normal ES against confidence level and holding period
### Aliases: NormalESPlot3D

### ** Examples

# Plots VaR against confidene level given geometric return data
   data <- runif(5, min = 0, max = .2)
   NormalESPlot3D(returns = data, cl = seq(.9,.99,.01), hp = 1:100)

   # Computes VaR against confidence level given mean and standard deviation of return data
   NormalESPlot3D(mu = .012, sigma = .03, cl = seq(.9,.99,.01), hp = 1:100)



