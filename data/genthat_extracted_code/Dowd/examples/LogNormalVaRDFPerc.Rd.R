library(Dowd)


### Name: LogNormalVaRDFPerc
### Title: Percentiles of VaR distribution function for normally
###   distributed geometric returns
### Aliases: LogNormalVaRDFPerc

### ** Examples

# Estimates Percentiles of VaR distribution
   data <- runif(5, min = 0, max = .2)
   LogNormalVaRDFPerc(returns = data, investment = 5, perc = .7, cl = .95, hp = 60)

   # Computes v given mean and standard deviation of return data
   LogNormalVaRDFPerc(mu = .012, sigma = .03, n= 10, investment = 5, perc = .8, cl = .99, hp = 40)



