library(Dowd)


### Name: LogNormalESDFPerc
### Title: Percentiles of ES distribution function for normally distributed
###   geometric returns
### Aliases: LogNormalESDFPerc

### ** Examples

# Estimates Percentiles of ES distribution
   data <- runif(5, min = 0, max = .2)
   LogNormalESDFPerc(returns = data, investment = 5, perc = .7, cl = .95, hp = 60)

   # Estimates Percentiles given mean, standard deviation and number of sambles of return data
   LogNormalESDFPerc(mu = .012, sigma = .03, n= 10, investment = 5, perc = .8, cl = .99, hp = 40)



