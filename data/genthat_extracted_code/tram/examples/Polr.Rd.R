library(tram)


### Name: Polr
### Title: Ordered Categorical Regression
### Aliases: Polr
### Keywords: models regression

### ** Examples


  data("wine", package = "ordinal")

  library("MASS")
  polr(rating ~ temp + contact, data = wine)

  Polr(rating ~ temp + contact, data = wine)




