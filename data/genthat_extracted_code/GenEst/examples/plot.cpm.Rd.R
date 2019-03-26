library(GenEst)


### Name: plot.cpm
### Title: Plot results of a single CP model
### Aliases: plot.cpm

### ** Examples

  data(wind_RP)
  mod <- cpm(formula_l = l ~ Season, formula_s = s ~ Season,  
           data = wind_RP$CP, left = "LastPresent", right = "FirstAbsent"
          )
 plot(mod)




