library(Dowd)


### Name: LogNormalESPlot2DHP
### Title: Plots log normal ES against holding period
### Aliases: LogNormalESPlot2DHP

### ** Examples

# Computes ES given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogNormalESPlot2DHP(returns = data, investment = 5, cl = .95, hp = 60:90)

   # Computes v given mean and standard deviation of return data
   LogNormalESPlot2DHP(mu = .012, sigma = .03, investment = 5, cl = .99, hp = 40:80)



