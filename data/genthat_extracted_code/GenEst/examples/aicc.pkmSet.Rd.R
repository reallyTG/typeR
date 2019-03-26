library(GenEst)


### Name: aicc.pkmSet
### Title: Create the AICc tables for a set of searcher efficiency models
### Aliases: aicc.pkmSet

### ** Examples

  data(wind_RP)
  mod <- pkmSet(formula_p = p ~ Season, formula_k = k ~ Season, data = wind_RP$SE)
 aicc(mod)




