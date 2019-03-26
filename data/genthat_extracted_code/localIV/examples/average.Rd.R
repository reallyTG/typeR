library(localIV)


### Name: average
### Title: Estimation of Average Causal Effects from Marginal Treatment
###   Effects
### Aliases: average

### ** Examples

mte_fit <- mte(selection = d ~ x + z, outcome = y ~ x,
  method = "localIV", data = toydata)

ate <- average(mte_fit, estimand = "ate")
att <- average(mte_fit, estimand = "att")
c(ate, att)




