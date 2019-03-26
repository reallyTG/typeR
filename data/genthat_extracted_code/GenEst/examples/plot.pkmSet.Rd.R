library(GenEst)


### Name: plot.pkmSet
### Title: Plot results of a set of SE models
### Aliases: plot.pkmSet

### ** Examples

  data(wind_RP)
  mod <- pkmSet(formula_p = p ~ Season, formula_k = k ~ Season,
           data = wind_RP$SE
         )
  plot(mod)




