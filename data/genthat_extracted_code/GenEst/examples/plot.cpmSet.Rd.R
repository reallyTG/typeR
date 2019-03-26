library(GenEst)


### Name: plot.cpmSet
### Title: Plot results of a set of CP models
### Aliases: plot.cpmSet

### ** Examples

  data(wind_RP)
  mod <- cpmSet(formula_l = l ~ Season, formula_s = s ~ Season,  
           data = wind_RP$CP, left = "LastPresent", right = "FirstAbsent")
 ## No test: 
plot(mod)
## End(No test)




