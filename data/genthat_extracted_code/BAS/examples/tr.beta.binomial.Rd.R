library(BAS)


### Name: tr.beta.binomial
### Title: Truncated Beta-Binomial Prior Distribution for Models
### Aliases: tr.beta.binomial tr.Beta.Binomial

### ** Examples


tr.beta.binomial(1, 10, 5)
library(MASS)
data(UScrime)
UScrime[, -2] <- log(UScrime[, -2])
crime.bic <- bas.lm(y ~ .,
  data = UScrime, n.models = 2^15, prior = "BIC",
  modelprior = tr.beta.binomial(1, 1, 8),
  initprobs = "eplogp"
)



