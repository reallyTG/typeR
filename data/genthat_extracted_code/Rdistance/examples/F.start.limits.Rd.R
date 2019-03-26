library(Rdistance)


### Name: F.start.limits
### Title: Set starting values and limits for parameters of Rdistance
###   functions
### Aliases: F.start.limits
### Keywords: models

### ** Examples

F.start.limits("uniform", 0, 0, 1000)
  F.start.limits("uniform", 1, 0, 1000)
  F.start.limits("uniform", 2, 0, 1000)
  F.start.limits("uniform", 3, 0, 1000)
  
  F.start.limits("halfnorm", 0, 0, 1000, 500*runif(100))
  F.start.limits("halfnorm", 1, 0, 1000, 500*runif(100))
  F.start.limits("halfnorm", 2, 0, 1000, 500*runif(100))
  F.start.limits("halfnorm", 3, 0, 1000, 500*runif(100))
  
  F.start.limits("hazrate", 0, 0, 1000)
  F.start.limits("hazrate", 1, 0, 1000)
  F.start.limits("hazrate", 2, 0, 1000)
  F.start.limits("hazrate", 3, 0, 1000)
  
  F.start.limits("negexp", 0, 0, 1000)
  F.start.limits("negexp", 1, 0, 1000)
  F.start.limits("negexp", 2, 0, 1000)
  F.start.limits("negexp", 3, 0, 1000)
  
  F.start.limits("Gamma", 0, 0, 1000, 1000*runif(100))



