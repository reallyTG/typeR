library(Dowd)


### Name: LogtESPlot2DHP
### Title: Plots log-t ES against holding period
### Aliases: LogtESPlot2DHP

### ** Examples

# Computes ES given geometric return data
   data <- runif(5, min = 0, max = .2)
   LogtESPlot2DHP(returns = data, investment = 5, df = 6, cl = .95, hp = 60:90)

   # Computes v given mean and standard deviation of return data
   LogtESPlot2DHP(mu = .012, sigma = .03, investment = 5, df = 6, cl = .99, hp = 40:80)



