library(robustloggamma)


### Name: sqrtloggamma
### Title: A reparametrization for the sigma parameter in loggamma model.
### Aliases: sqrtloggamma
### Keywords: datasets

### ** Examples

  str(sqrtloggamma)
  set.seed(1234)
  x <- sort(rloggamma(n=50, lambda=1))
  res <- loggammarob(x, control=loggammarob.control(lower=0, upper=2,
  n=30, reparam=sqrtloggamma))
  print(res)



