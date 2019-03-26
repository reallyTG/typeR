library(Dowd)


### Name: LogtESDFPerc
### Title: Percentiles of ES distribution function for Student-t
### Aliases: LogtESDFPerc

### ** Examples

# Estimates Percentiles of ES distribution
   data <- runif(5, min = 0, max = .2)
   LogtESDFPerc(returns = data, investment = 5, perc = .7, df = 6, cl = .95, hp = 60)

   # Computes v given mean and standard deviation of return data
   LogtESDFPerc(mu = .012, sigma = .03, n= 10, investment = 5, perc = .8, df = 6, cl = .99, hp = 40)



