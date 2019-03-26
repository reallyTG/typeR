library(GenEst)


### Name: aicc.cpmSetSize
### Title: Create the AICc tables for a list of sets of searcher efficiency
###   models
### Aliases: aicc.cpmSetSize

### ** Examples

 cpmods <- cpm(formula_l = l ~ Visibility, data = wind_RP$CP,
   left = "LastPresent", right = "FirstAbsent", sizeCol = "Size",
   allCombos = TRUE)
 aicc(cpmods)




