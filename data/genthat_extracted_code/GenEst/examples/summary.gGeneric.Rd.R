library(GenEst)


### Name: summary.gGeneric
### Title: Summarize the gGeneric list to a simple table
### Aliases: summary.gGeneric

### ** Examples

  data(mock)
  model_SE <- pkm(formula_p = p ~ HabitatType, formula_k = k ~ 1,
                data = mock$SE)
  model_CP <- cpm(formula_l = l ~ Visibility, formula_s = s ~ Visibility, 
                data = mock$CP, left = "LastPresentDecimalDays", 
                right = "FirstAbsentDecimalDays")
  avgSS <- averageSS(mock$SS)
  ghatsGeneric <- estgGeneric(nsim = 1000, avgSS, model_SE, model_CP,
                    seed_SE = 1, seed_CP = 1)
  summary(ghatsGeneric)




