library(BAS)


### Name: tr.power.prior
### Title: Truncated Power Prior Distribution for Models
### Aliases: tr.power.prior tr.Power.Prior

### ** Examples


tr.power.prior(2, 8)
library(MASS)
data(UScrime)
UScrime[, -2] <- log(UScrime[, -2])
crime.bic <- bas.lm(y ~ .,
  data = UScrime, n.models = 2^15, prior = "BIC",
  modelprior = tr.power.prior(2, 8),
  initprobs = "eplogp"
)



