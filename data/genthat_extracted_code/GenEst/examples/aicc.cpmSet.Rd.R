library(GenEst)


### Name: aicc.cpmSet
### Title: Create the AICc tables for a set of carcass persistence models
### Aliases: aicc.cpmSet

### ** Examples

  data(wind_RP)
  mod <- cpmSet(formula_l = l ~ Season * Visibility, formula_s = s ~ Season,
           data = wind_RP$CP, left = "LastPresent", right = "FirstAbsent")
 aicc(mod)




