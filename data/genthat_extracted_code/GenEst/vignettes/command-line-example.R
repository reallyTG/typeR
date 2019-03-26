## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- include=FALSE------------------------------------------------------
library(GenEst)
vers <- packageVersion("GenEst")
today <- Sys.Date()

## ------------------------------------------------------------------------
data(mock)
names(mock)

## ------------------------------------------------------------------------
data_SE <- mock$SE
pkModel <- pkm(formula_p = p ~ 1, formula_k = k ~ 1, data = data_SE)

## ------------------------------------------------------------------------
head(data_SE)

## ------------------------------------------------------------------------
pkModel <- pkm(formula_p = p ~ 1, formula_k = k ~ 1, data = data_SE,
             obsCol = c("Search1", "Search2", "Search3", "Search4")
           )

## ------------------------------------------------------------------------
pkModel

## ------------------------------------------------------------------------
names(pkModel)
pkModel$cells

## ---- fig.show = "hold", fig.width = 7, fig.height = 7, fig.align = 'center'----
plot(pkModel)

## ------------------------------------------------------------------------
rpk(n = 10, pkModel)

## ------------------------------------------------------------------------
pkm(formula_p = p ~ Visibility, formula_k = k ~ HabitatType, data = data_SE,
  obsCol = c("Search1", "Search2", "Search3", "Search4")
)

## ------------------------------------------------------------------------
pkm(formula_p = p ~ Visibility, kFixed = 0.7, data = data_SE,
  obsCol = c("Search1", "Search2", "Search3", "Search4"))

## ------------------------------------------------------------------------
pkmModSet <- pkm(formula_p = p ~ Visibility*HabitatType,
               formula_k = k ~ HabitatType, data = data_SE,
               obsCol = c("Search1", "Search2", "Search3", "Search4"),
               allCombos = TRUE
             )
class(pkmModSet)
names(pkmModSet)

## ---- eval = F, fig.show = "hold", fig.width = 7, fig.height = 7, fig.align = 'center'----
#  plot(pkmModSet, specificModel = "p ~ Visibility + HabitatType; k ~ 1")

## ------------------------------------------------------------------------
aicc(pkmModSet)

## ------------------------------------------------------------------------
pkmModSetSize <- pkm(formula_p = p ~ Visibility*HabitatType,
                   formula_k = k ~ HabitatType, data = data_SE,
                   obsCol = c("Search1", "Search2", "Search3", "Search4"),
                   sizeCol = "Size", allCombos = TRUE)
class(pkmModSetSize)

## ------------------------------------------------------------------------
names(pkmModSetSize)
names(pkmModSetSize[[1]])

## ------------------------------------------------------------------------
data_CP <- mock$CP
cpModel <- cpm(formula_l = l ~ 1, formula_s = s ~ 1, data = data_CP,
             left = "LastPresentDecimalDays",
             right = "FirstAbsentDecimalDays", dist = "weibull"
           )

## ------------------------------------------------------------------------
cpModel

## ------------------------------------------------------------------------
names(cpModel)
cpModel$cells

## ---- fig.show = "hold", fig.width = 6, fig.height = 6, fig.align = 'center'----
plot(cpModel)

## ------------------------------------------------------------------------
rcp(n = 10, cpModel)
rcp(n = 10, cpModel, type = "ppersist")

## ------------------------------------------------------------------------
cpm(formula_l = l ~ Visibility * GroundCover, formula_s = s ~ 1, data = data_CP,
  left = "LastPresentDecimalDays", right = "FirstAbsentDecimalDays",
  dist = "weibull"
)

## ------------------------------------------------------------------------
cpModExp <- cpm(formula_l = l ~ Visibility * GroundCover, data = data_CP,
              left = "LastPresentDecimalDays",
              right = "FirstAbsentDecimalDays", dist = "exponential"
            )

## ------------------------------------------------------------------------
cpmModSet <- cpm(formula_l = l ~ Visibility * Season,
               formula_s = s ~ Visibility, data = data_CP,
               left = "LastPresentDecimalDays",
               right = "FirstAbsentDecimalDays",
               dist = c("exponential", "lognormal"), allCombos = TRUE
             )
class(cpmModSet)
names(cpmModSet)

## ------------------------------------------------------------------------
aicc(cpmModSet)

## ---- fig.show = "hold", fig.width = 7, fig.height = 7, fig.align = 'center'----
plot(cpmModSet,
  specificModel = "dist: lognormal; l ~ Visibility * Season; s ~ Visibility"
)

## ------------------------------------------------------------------------
cpmModSetSize <- cpm(formula_l = l ~ Visibility * Season,
                   formula_s = s ~ Visibility, data = data_CP,
                   left = "LastPresentDecimalDays",
                   right = "FirstAbsentDecimalDays",
                   dist = c("exponential", "lognormal"),
                   sizeCol = "Size", allCombos = TRUE)
class(cpmModSetSize)

## ------------------------------------------------------------------------
names(cpmModSetSize)
names(cpmModSetSize[[1]])
class(cpmModSetSize[[1]])

## ------------------------------------------------------------------------
pkMods <- c("S" = "p ~ 1; k ~ 1", "L" = "p ~ 1; k ~ 1",
            "M" = "p ~ 1; k ~ 1", "XL" = "p ~ 1; k ~ HabitatType"
          )
cpMods <- c("S" = "dist: exponential; l ~ Season; NULL",
            "L" = "dist: exponential; l ~ 1; NULL",
            "M" = "dist: exponential; l ~ 1; NULL",
            "XL" = "dist: exponential; l ~ 1; NULL"
          )

## ------------------------------------------------------------------------
data_SS <- mock$SS
avgSS <- averageSS(data_SS)

gsGeneric <- estgGenericSize(nsim = 1000, days = avgSS,
               modelSetSize_SE = pkmModSetSize,
               modelSetSize_CP = cpmModSetSize,
               modelSizeSelections_SE = pkMods,
               modelSizeSelections_CP = cpMods
             )

## ------------------------------------------------------------------------
summary(gsGeneric)

## ---- fig.show = "hold", fig.width = 4, fig.height = 14, fig.align = 'center'----
plot(gsGeneric)

## ------------------------------------------------------------------------
pkmModSize <- trimSetSize(pkmModSetSize, pkMods)
cpmModSize <- trimSetSize(cpmModSetSize, cpMods)

## ------------------------------------------------------------------------
data_CO <- mock$CO
data_DWP <- mock$DWP
head(data_DWP)
DWPcolnames <- names(pkmModSize)

eM <- estM(data_CO = data_CO, data_SS = data_SS, data_DWP = data_DWP,
        frac = 1, model_SE = pkmModSize, model_CP = cpmModSize,
        seed_SE = NULL, seed_CP = NULL, seed_g = NULL, seed_M = NULL,
        unitCol = "Unit", COdate = "DateFound",
        SSdate = "DateSearched", sizeCol = "Size", nsim = 1000)

## ---- fig.show = "hold", fig.width = 6, fig.height = 6, fig.align = 'center'----
summary(eM)
plot(eM)

## ---- fig.show = "hold", fig.width = 4, fig.height = 6, fig.align = 'center'----
M_season <- calcSplits(M = eM, split_SS = "Construction",
                 split_CO = NULL, data_SS = data_SS, data_CO = data_CO
             )
summary(M_season)
plot(M_season)

## ---- fig.show = "hold", fig.width = 4, fig.height = 6, fig.align = 'center'----
M_class <- calcSplits(M = eM, split_SS = NULL,
             split_CO = "Split", data_SS = data_SS, data_CO = data_CO
           )
summary(M_class)
plot(M_class)

## ---- fig.show = "hold", fig.width = 4, fig.height = 8, fig.align = 'center'----
M_SbyC <- calcSplits(M = eM, split_SS = "Construction",
            split_CO = "Split", data_SS = data_SS, data_CO = data_CO
          )
summary(M_SbyC)
plot(M_SbyC)

