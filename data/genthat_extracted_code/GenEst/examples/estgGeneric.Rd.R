library(GenEst)


### Name: estgGeneric
### Title: Estimate generic g
### Aliases: estgGeneric

### ** Examples

  data(mock)
  model_SE <- pkm(formula_p = p ~ HabitatType, formula_k = k ~ 1,
                data = mock$SE)
  model_CP <- cpm(formula_l = l ~ Visibility, formula_s = s ~ Visibility, 
                data = mock$CP, left = "LastPresentDecimalDays", 
                right = "FirstAbsentDecimalDays")
  avgSS <- averageSS(mock$SS)
  ghatsGeneric <- estgGeneric(days = avgSS, model_SE = model_SE,
   model_CP = model_CP)




