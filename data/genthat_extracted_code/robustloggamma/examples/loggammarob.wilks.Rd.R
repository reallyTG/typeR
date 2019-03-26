library(robustloggamma)


### Name: loggammarob.wilks
### Title: Robust Wilks test for generalized log gamma model.
### Aliases: loggammarob.wilks
### Keywords: robust models

### ** Examples

  set.seed(1234)
  x <- sort(log(rgamma(n=30, shape=2, scale=2)))
  res <- loggammarob(x)
  loggammarob.wilks(res)



