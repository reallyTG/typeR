library(GenEst)


### Name: pkm
### Title: Fit pk searcher efficiency models.
### Aliases: pkm pkm0 pkmSet pkmSize

### ** Examples

 head(data(wind_RP))
 mod1 <- pkm(formula_p = p ~ Season, formula_k = k ~ 1, data = wind_RP$SE)
 class(mod1)
 mod2 <- pkm(formula_p = p ~ Season, formula_k = k ~ 1, data = wind_RP$SE,
   allCombos = TRUE)
 class(mod2)
 names(mod2)
 class(mod2[[1]])
 mod3 <- pkm(formula_p = p ~ Season, formula_k = k ~ 1, data = wind_RP$SE,
   allCombos = TRUE, sizeCol = "Size")
 class(mod3)
 names(mod3)
 class(mod3[[1]])
 class(mod3[[1]][[1]])




