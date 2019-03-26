library(GenEst)


### Name: plot.gGeneric
### Title: Plot results of a single generic ghat estimation
### Aliases: plot.gGeneric

### ** Examples

  data(mock)
  model_SE <- pkm(formula_p = p ~ HabitatType, formula_k = k ~ 1,
                data = mock$SE)
  model_CP <- cpm(formula_l = l ~ Visibility, formula_s = s ~ Visibility, 
                data = mock$CP, left = "LastPresentDecimalDays", 
                right = "FirstAbsentDecimalDays")
  avgSS <- averageSS(mock$SS)
  ghatsGeneric <- estgGeneric(nsim = 1000, avgSS, model_SE, model_CP)
  plot(ghatsGeneric)




