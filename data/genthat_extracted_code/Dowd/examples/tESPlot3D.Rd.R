library(Dowd)


### Name: tESPlot3D
### Title: Plots t ES against confidence level and holding period
### Aliases: tESPlot3D

### ** Examples

# Plots ES against confidene level given P/L data
   data <- runif(5, min = 0, max = .2)
   tESPlot3D(returns = data, df = 6, cl = seq(.85,.99,.01), hp = 60:90)

   # Computes ES against confidence level given mean and standard deviation of return data
   tESPlot3D(mu = .012, sigma = .03, df = 6, cl = seq(.85,.99,.02), hp = 40:80)



