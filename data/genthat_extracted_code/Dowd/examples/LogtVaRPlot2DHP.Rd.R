library(Dowd)


### Name: LogtVaRPlot2DHP
### Title: Plots log-t VaR against holding period
### Aliases: LogtVaRPlot2DHP

### ** Examples

# Computes VaR given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogtVaRPlot2DHP(returns = data, investment = 5, df = 6, cl = .95, hp = 60:90)

   # Computes VaR given mean and standard deviation of return data
   LogtVaRPlot2DHP(mu = .012, sigma = .03, investment = 5, df = 6, cl = .99, hp = 40:80)



