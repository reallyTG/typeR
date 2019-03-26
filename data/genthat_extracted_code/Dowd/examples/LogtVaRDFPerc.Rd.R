library(Dowd)


### Name: LogtVaRDFPerc
### Title: Percentiles of VaR distribution function for Student-t
### Aliases: LogtVaRDFPerc

### ** Examples

# Estimates Percentiles of VaR distribution
   data <- runif(5, min = 0, max = .2)
   LogtVaRDFPerc(returns = data, investment = 5, perc = .7,
                 df = 6, cl = .95, hp = 60)

   # Computes v given mean and standard deviation of return data
   LogtVaRDFPerc(mu = .012, sigma = .03, n= 10, investment = 5,
                 perc = .8, df = 6, cl = .99, hp = 40)



