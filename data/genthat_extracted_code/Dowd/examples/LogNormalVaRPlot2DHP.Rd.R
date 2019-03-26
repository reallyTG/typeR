library(Dowd)


### Name: LogNormalVaRPlot2DHP
### Title: Plots log normal VaR against holding period
### Aliases: LogNormalVaRPlot2DHP

### ** Examples

# Computes VaR given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogNormalVaRPlot2DHP(returns = data, investment = 5, cl = .95, hp = 60:90)

   # Computes VaR given mean and standard deviation of return data
   LogNormalVaRPlot2DHP(mu = .012, sigma = .03, investment = 5, cl = .99, hp = 40:80)



