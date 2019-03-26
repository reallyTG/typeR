library(AER)


### Name: BenderlyZwick
### Title: Benderly and Zwick Data: Inflation, Growth and Stock Returns
### Aliases: BenderlyZwick
### Keywords: datasets

### ** Examples

data("BenderlyZwick")
plot(BenderlyZwick)

## Benderly and Zwick (1985), p. 1116
library("dynlm")
bz_ols <- dynlm(returns ~ growth + inflation,
  data = BenderlyZwick/100, start = 1956, end = 1981)
summary(bz_ols)

## Zaman, Rousseeuw and Orhan (2001)
## use larger period, without scaling
bz_ols2 <- dynlm(returns ~ growth + inflation,
  data = BenderlyZwick, start = 1954, end = 1981)
summary(bz_ols2)



