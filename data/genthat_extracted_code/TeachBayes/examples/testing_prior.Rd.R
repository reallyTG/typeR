library(TeachBayes)


### Name: testing_prior
### Title: Testing prior for two proportions
### Aliases: testing_prior

### ** Examples

  # testing prior where each proportion is
  # .1, .3, .5, .7, .9
  Prob <- testing_prior(.1, .9, 5)
  # uniform prior over same proportion values
  Prob <- testing_prior(.1, .9, 5, uniform=TRUE)



