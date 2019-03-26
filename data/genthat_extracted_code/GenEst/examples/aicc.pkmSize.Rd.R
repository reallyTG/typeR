library(GenEst)


### Name: aicc.pkmSize
### Title: Create the AICc tables for a list of sets of searcher efficiency
###   models
### Aliases: aicc.pkmSize

### ** Examples

  data(wind_RP)
  mod <- pkmSet(formula_p = p ~ Season, formula_k = k ~ Season, data = wind_RP$SE)
 aicc(mod)




