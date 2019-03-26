library(GenEst)


### Name: plot.estM
### Title: Plot total mortality estimation
### Aliases: plot.estM

### ** Examples

 ## Not run: 
##D  data(mock)
##D  model_SE <- pkm(formula_p = p ~ HabitatType, formula_k = k ~ 1,
##D               data = mock$SE)
##D  model_CP <- cpm(formula_l = l ~ Visibility, formula_s = s ~ Visibility, 
##D                data = mock$CP, dist = "weibull",
##D                left = "LastPresentDecimalDays", 
##D                right = "FirstAbsentDecimalDays")
##D  eM <- estM(nsim = 1000, data_CO = mock$CO, data_SS = mock$SS, 
##D          data_DWP = mock$DWP, frac = 1, model_SE = model_SE, 
##D          model_CP = model_CP, COdate = "DateFound",
##D          DWPCol = "S", sizeCol = NULL)
##D  plot(eM)
##D  
## End(Not run)




