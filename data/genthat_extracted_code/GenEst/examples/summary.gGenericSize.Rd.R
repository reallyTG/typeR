library(GenEst)


### Name: summary.gGenericSize
### Title: Summarize the gGenericSize list to a list of simple tables
### Aliases: summary.gGenericSize

### ** Examples

  data(mock)
  pkmModsSize <- pkm(formula_p = p ~ HabitatType,
                   formula_k = k ~ HabitatType, data = mock$SE,
                   obsCol = c("Search1", "Search2", "Search3", "Search4"),
                   sizeCol = "Size", allCombos = TRUE)
  cpmModsSize <- cpm(formula_l = l ~ Visibility,
                   formula_s = s ~ Visibility, data = mock$CP,
                   left = "LastPresentDecimalDays",
                   right = "FirstAbsentDecimalDays",
                   dist = c("exponential", "lognormal"),
                   sizeCol = "Size", allCombos = TRUE)
  pkMods <- c("S" = "p ~ 1; k ~ 1", "L" = "p ~ 1; k ~ 1",
             "M" = "p ~ 1; k ~ 1", "XL" = "p ~ 1; k ~ 1"
            )
  cpMods <- c("S" = "dist: exponential; l ~ 1; NULL", 
              "L" = "dist: exponential; l ~ 1; NULL",
              "M" = "dist: exponential; l ~ 1; NULL",
              "XL" = "dist: exponential; l ~ 1; NULL"
            )
  avgSS <- averageSS(mock$SS)
  gsGeneric <- estgGenericSize(nsim = 1000, days = avgSS,
                 modelSetSize_SE = pkmModsSize,
                 modelSetSize_CP = cpmModsSize,
                 modelSizeSelections_SE = pkMods,
                 modelSizeSelections_CP = cpMods
               )
 summary(gsGeneric)




