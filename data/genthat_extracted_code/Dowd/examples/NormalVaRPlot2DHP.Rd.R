library(Dowd)


### Name: NormalVaRPlot2DHP
### Title: Plots normal VaR against holding period
### Aliases: NormalVaRPlot2DHP

### ** Examples

# Computes VaR given P/L data
   data <- runif(5, min = 0, max = .2)
   NormalVaRPlot2DHP(returns = data, cl = .95, hp = 60:90)

   # Computes VaR given mean and standard deviation of P/L data
   NormalVaRPlot2DHP(mu = .012, sigma = .03, cl = .99, hp = 40:80)



