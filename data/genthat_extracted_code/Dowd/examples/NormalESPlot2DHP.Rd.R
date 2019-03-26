library(Dowd)


### Name: NormalESPlot2DHP
### Title: Plots normal ES against holding period
### Aliases: NormalESPlot2DHP

### ** Examples

# Computes ES given geometric return data
   data <- runif(5, min = 0, max = .2)
   NormalESPlot2DHP(returns = data, cl = .95, hp = 60:90)

   # Computes v given mean and standard deviation of return data
   NormalESPlot2DHP(mu = .012, sigma = .03, cl = .99, hp = 40:80)



