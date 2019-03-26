library(Dowd)


### Name: tVaRDFPerc
### Title: Percentiles of VaR distribution function
### Aliases: tVaRDFPerc

### ** Examples

# Estimates Percentiles of VaR distribution
   data <- runif(5, min = 0, max = .2)
   tVaRDFPerc(returns = data, perc = .7,
                 df = 6, cl = .95, hp = 60)

   # Computes v given mean and standard deviation of return data
   tVaRDFPerc(mu = .012, sigma = .03, n= 10,
                 perc = .8, df = 6, cl = .99, hp = 40)



