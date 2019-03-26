library(Dowd)


### Name: tESDFPerc
### Title: Percentiles of ES distribution function for t-distributed P/L
### Aliases: tESDFPerc

### ** Examples

# Estimates Percentiles of ES distribution given P/L data
   data <- runif(5, min = 0, max = .2)
   tESDFPerc(returns = data, perc = .7, df = 6, cl = .95, hp = 60)

   # Estimates Percentiles of ES distribution given mean, std. deviation and sample size
   tESDFPerc(mu = .012, sigma = .03, n= 10, perc = .8, df = 6, cl = .99, hp = 40)



