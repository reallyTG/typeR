library(GenEst)


### Name: estg
### Title: Estimate all carcass-level detection rates and arrival intervals
### Aliases: estg

### ** Examples

 data(mock)
 model_SE <- pkm(formula_p = p ~ HabitatType, formula_k = k ~ 1,
              data = mock$SE)
 model_CP <- cpm(formula_l = l ~ Visibility, formula_s = s ~ Visibility, 
               data = mock$CP, dist = "weibull",
               left = "LastPresentDecimalDays", 
               right = "FirstAbsentDecimalDays"
             )
 ghat <- estg(data_CO = mock$CO, COdate = "DateFound",  data_SS = mock$SS,
           model_SE = model_SE, model_CP = model_CP, unitCol = "Unit", nsim = 100)




