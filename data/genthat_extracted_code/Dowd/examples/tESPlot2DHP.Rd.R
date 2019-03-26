library(Dowd)


### Name: tESPlot2DHP
### Title: Plots t ES against holding period
### Aliases: tESPlot2DHP

### ** Examples

# Computes ES given geometric return data
   data <- runif(5, min = 0, max = .2)
   tESPlot2DHP(returns = data, df = 6, cl = .95, hp = 60:90)

   # Computes v given mean and standard deviation of return data
   tESPlot2DHP(mu = .012, sigma = .03, df = 6, cl = .99, hp = 40:80)



