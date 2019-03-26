library(BAS)


### Name: diagnostics
### Title: BAS MCMC diagnostic plot
### Aliases: diagnostics

### ** Examples


library(MASS)
data(UScrime)
UScrime[, -2] <- log(UScrime[, -2])
crime.ZS <- bas.lm(y ~ .,
  data = UScrime,
  prior = "ZS-null",
  modelprior = uniform(),
  method = "MCMC",
  MCMC.iter = 1000
) # short run for the example
diagnostics(crime.ZS)



