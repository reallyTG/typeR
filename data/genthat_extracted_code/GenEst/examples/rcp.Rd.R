library(GenEst)


### Name: rcp
### Title: Simulate parameters from a fitted cp model
### Aliases: rcp

### ** Examples

  data(wind_RP)
  mod <- cpm(formula_l = l ~ 1, data = wind_RP$CP, left = "LastPresent",
           right = "FirstAbsent"
         )
  rcp(n = 10, model = mod, type = "survreg")
  rcp(n = 10, model = mod, type = "ppersist")




