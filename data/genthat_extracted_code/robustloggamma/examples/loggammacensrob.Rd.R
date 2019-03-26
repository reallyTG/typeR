library(robustloggamma)


### Name: loggammacensrob
### Title: Robust estimation of the three parameters extended Log Gamma
###   model in presence of censored observations.
### Aliases: loggammacensrob
### Keywords: robust models

### ** Examples

  set.seed(1234)
  x <- sort(rloggamma(n=80, lambda=1))
  cens <- rloggamma(n=80, mu=1.5, lambda=1)
  delta <- as.numeric(x <= cens)
  x[delta==0] <- cens[delta==0]  
  res <- loggammacensrob(x, delta, method="oneTML",
    control=loggammarob.control(lower=0, upper=2, n=30))
  print(res)
  summary(res)



