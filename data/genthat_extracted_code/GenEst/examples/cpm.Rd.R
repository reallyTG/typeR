library(GenEst)


### Name: cpm
### Title: Fit cp carcass persistence models
### Aliases: cpm cpm0 cpmSet cpmSize

### ** Examples

 head(data(wind_RP))
 mod1 <- cpm(formula_l = l ~ Season, formula_s = s ~ 1, data = wind_RP$CP,
   left = "LastPresent", right = "FirstAbsent")
 class(mod1)
 mod2 <- cpm(formula_l = l ~ Season, formula_s = s ~ 1, data = wind_RP$CP,
   left = "LastPresent", right = "FirstAbsent", allCombos = TRUE)
 class(mod2)
 names(mod2)
 class(mod2[[1]])
 mod3 <- cpm(formula_l = l ~ Season, formula_s = s ~ 1, data = wind_RP$CP,
   left = "LastPresent", right = "FirstAbsent",
   allCombos = TRUE, sizeCol = "Size")
 class(mod3)
 names(mod3)
 class(mod3[[1]])
 class(mod3[[1]][[1]])




