library(Dowd)


### Name: tVaRPlot2DHP
### Title: Plots t VaR against holding period
### Aliases: tVaRPlot2DHP

### ** Examples

# Computes VaR given P/L data data
   data <- runif(5, min = 0, max = .2)
   tVaRPlot2DHP(returns = data, df = 6, cl = .95, hp = 60:90)

   # Computes VaR given mean and standard deviation of return data
   tVaRPlot2DHP(mu = .012, sigma = .03, df = 6, cl = .99, hp = 40:80)



