library(Dowd)


### Name: NormalVaRDFPerc
### Title: Percentiles of VaR distribution function for normally
###   distributed P/L
### Aliases: NormalVaRDFPerc

### ** Examples

# Estimates Percentiles of VaR distribution
   data <- runif(5, min = 0, max = .2)
   NormalVaRDFPerc(returns = data, perc = .7, cl = .95, hp = 60)

   # Estimates Percentiles of VaR distribution
   NormalVaRDFPerc(mu = .012, sigma = .03, n= 10, perc = .8, cl = .99, hp = 40)



