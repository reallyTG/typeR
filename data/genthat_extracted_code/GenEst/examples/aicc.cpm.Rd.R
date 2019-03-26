library(GenEst)


### Name: aicc.cpm
### Title: Extract AIC and AICc for a carcass persistence model
### Aliases: aicc.cpm

### ** Examples

  data(wind_RP)
  mod <- cpm(formula_l = l ~ Season, formula_s = s ~ Season,
           data = wind_RP$CP, left = "LastPresent", right = "FirstAbsent")
 aicc(mod)




