library(rv)


### Name: is.fuzzy
### Title: Fuzziness
### Aliases: is.fuzzy fuzzy is.fuzzy.rv
### Keywords: classes

### ** Examples


  x <- as.logical(rvbern(1,0.4)) # a logical random variable
  is.fuzzy(x) # TRUE, since x is logical and not constant
  is.fuzzy(x<2) # FALSE, since x is less than 2 with probability one
  is.fuzzy(rvnorm(1)) # FALSE, since it's not a probability
  is.fuzzy(TRUE) # FALSE, since TRUE is strictly TRUE
  is.fuzzy(1) # FALSE, since 1 is not a logical variable




