library(Dowd)


### Name: NormalESDFPerc
### Title: Percentiles of ES distribution function for normally distributed
###   P/L data
### Aliases: NormalESDFPerc

### ** Examples

# Estimates Percentiles of ES distribution
   data <- runif(5, min = 0, max = .2)
   NormalESDFPerc(returns = data, perc = .7, cl = .95, hp = 60)

   # Estimates Percentiles given mean, standard deviation and number of sambles of return data
   NormalESDFPerc(mu = .012, sigma = .03, n= 10, perc = .8, cl = .99, hp = 40)



