library(robustloggamma)


### Name: loggammarob
### Title: Robust estimation of the three parameters extended Log Gamma
###   model.
### Aliases: loggammarob print.loggammarob
### Keywords: robust models

### ** Examples

  set.seed(1234)
  x <- sort(rloggamma(n=80, lambda=1))
  res <- loggammarob(x, control=loggammarob.control(lower=0, upper=2, n=30))
  print(res)



