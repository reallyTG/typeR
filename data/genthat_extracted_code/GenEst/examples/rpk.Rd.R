library(GenEst)


### Name: rpk
### Title: Simulate parameters from a fitted pk model
### Aliases: rpk

### ** Examples

  data(wind_RP)
  mod <- pkm(formula_p = p ~ 1, formula_k = k ~ Season, data = wind_RP$SE)
  rpk(n = 10, model = mod)




