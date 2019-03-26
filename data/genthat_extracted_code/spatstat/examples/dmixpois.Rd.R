library(spatstat)


### Name: dmixpois
### Title: Mixed Poisson Distribution
### Aliases: dmixpois pmixpois qmixpois rmixpois
### Keywords: distribution

### ** Examples

  dmixpois(7, 10, 1, invlink = I)
  dpois(7, 10)

  pmixpois(7, log(10), 0.2)
  ppois(7, 10)

  qmixpois(0.95, log(10), 0.2)
  qpois(0.95, 10)

  x <- rmixpois(100, log(10), log(1.2))
  mean(x)
  var(x)



