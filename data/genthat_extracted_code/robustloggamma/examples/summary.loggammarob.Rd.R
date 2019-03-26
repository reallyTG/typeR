library(robustloggamma)


### Name: summary.loggammarob
### Title: Summary Method for '"loggammarob"' Objects
### Aliases: summary.loggammarob print.summary.loggammarob
### Keywords: robust models

### ** Examples

  set.seed(1234)
  x <- rloggamma(n=50, lambda=1)
  res <- loggammarob(x, control=loggammarob.control(lower=0, upper=2, n=30))
  summary(res)



