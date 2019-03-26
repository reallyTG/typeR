## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----set-options, echo=FALSE, cache=FALSE-----------------------------------------------------------------------------
options(width = 120)

## ---- include=FALSE---------------------------------------------------------------------------------------------------
library(GenEst)
vers <- packageVersion("GenEst")
today <- Sys.Date()

## ---------------------------------------------------------------------------------------------------------------------
data(wind_RPbat)
names(wind_RPbat)

## ---------------------------------------------------------------------------------------------------------------------
data_SE <- wind_RPbat$SE
data_CP <- wind_RPbat$CP
data_SS <- wind_RPbat$SS
data_DWP <- wind_RPbat$DWP
data_CO <- wind_RPbat$CO

## ---- include = FALSE-------------------------------------------------------------------------------------------------
daterange <- range(data_SS$SearchDate)
seasons <- paste(unique(data_SS$Season), collapse = ', ')

## ---------------------------------------------------------------------------------------------------------------------
head(data_SE)

## ---------------------------------------------------------------------------------------------------------------------
head(data_CP)

## ---------------------------------------------------------------------------------------------------------------------
head(data_SS[, 1:10])

## ---------------------------------------------------------------------------------------------------------------------
head(data_DWP)

## ---------------------------------------------------------------------------------------------------------------------
head(data_CO)

## ---------------------------------------------------------------------------------------------------------------------
model_SE <- pkm(p ~ Season, k ~ 1, data = data_SE)
class(model_SE)
model_SE

## ---------------------------------------------------------------------------------------------------------------------
model_CP <- cpm(l ~ Season, s ~ Season, data = data_CP, dist = "weibull",
  left = "LastPresent", right = "FirstAbsent")
class(model_CP)
model_CP

## ---- fig.width = 7, fig.height = 5, fig.align = 'center'-------------------------------------------------------------
Mhat <- estM(nsim = 1000, data_CO = data_CO, data_SS = data_SS,
  data_DWP = data_DWP, model_SE = model_SE, model_CP = model_CP,
  unitCol = "Turbine", COdate = "DateFound")

summary(Mhat)
plot(Mhat)

## ---- fig.width = 5, fig.height = 5, fig.align = 'center'-------------------------------------------------------------
M_species <- calcSplits(M = Mhat, split_CO = "Species", data_CO = data_CO)
summary(M_species)
plot(M_species)

## ---------------------------------------------------------------------------------------------------------------------
SSdat <- prepSS(data_SS)

## ----Season Split, fig.width = 6.5, fig.height = 5.25, fig.align = 'center'-------------------------------------------
M_season <- calcSplits(M = Mhat, split_SS = "Season", data_SS = SSdat,
  split_CO = NULL,  data_CO = data_CO)
summary(M_season)
plot(M_season)

## ----Temporal Split, fig.width = 7, fig.height = 5, fig.align = 'center'----------------------------------------------
M_month <- calcSplits(M = Mhat, split_time = seq(0, max(SSdat$days), by = 28),
  data_SS = SSdat, data_CO = data_CO)
summary(M_month)
plot(M_month)

## ----Time unit Split, fig.width = 7, fig.height = 5, fig.align = 'center'---------------------------------------------
M_various_times <- calcSplits(M = Mhat,
  split_time = c(seq(0, 90, by = 15), 120, 150, seq(155, 200, by = 5)),
  data_SS = SSdat, data_CO = data_CO)
plot(M_various_times)
plot(M_various_times, rate = TRUE)

## ----Species and Season, fig.width = 4, fig.height = 6, fig.align = 'center'------------------------------------------
M_species_by_season <- calcSplits(M = Mhat,
  split_CO = "Species", data_CO = data_CO,
  split_SS = "Season", data_SS = SSdat)
plot(M_species_by_season)

## ---------------------------------------------------------------------------------------------------------------------
data(wind_cleared)
names(wind_cleared)

## ---------------------------------------------------------------------------------------------------------------------
data_SE <- wind_cleared$SE
data_CP <- wind_cleared$CP
data_SS <- wind_cleared$SS
data_DWP <- wind_cleared$DWP
data_CO <- wind_cleared$CO

## ---------------------------------------------------------------------------------------------------------------------
head(data_SE)
head(data_CP)

## ---------------------------------------------------------------------------------------------------------------------
pkModels <- pkm(p ~ Visibility * Season, k ~ Visibility * Season, data = data_SE,
  allCombos = TRUE, sizeCol = "Size")
class(pkModels)
names(pkModels)

## ---------------------------------------------------------------------------------------------------------------------
names(pkModels[["sml"]])
class(pkModels[["sml"]])

## ---------------------------------------------------------------------------------------------------------------------
aicc(pkModels[["sml"]])

## ---- fig.show = "hold", fig.width = 7, fig.height = 7----------------------------------------------------------------
plot(pkModels[["sml"]], specificModel = "p ~ Visibility; k ~ 1")

## ---- fig.show = "hold", fig.width = 7, fig.height = 7----------------------------------------------------------------
plot(pkModels[["sml"]], specificModel = "p ~ Season; k ~ Visibility * Season")

## ---------------------------------------------------------------------------------------------------------------------
pkMods <- list(
  sml = pkModels[["sml"]][["p ~ Visibility; k ~ 1"]],
  med = pkModels[["med"]][["p ~ Visibility; k ~ 1"]],
  lrg = pkModels[["lrg"]][["p ~ Visibility; k ~ 1"]],
  bat = pkModels[["bat"]][["p ~ Visibility; k ~ 1"]]
)

## ---------------------------------------------------------------------------------------------------------------------
cpModels <- cpm(
  l ~ Visibility * Season, s ~ Visibility * Season,
  data = data_CP, left = "LastPresent", right = "FirstAbsent",
  dist = c( "weibull", "lognormal", "loglogistic", "exponential"),
  allCombos = TRUE, sizeCol = "Size"
)

## ---------------------------------------------------------------------------------------------------------------------
lapply(aicc(cpModels), nrow)
aicc(cpModels[["sml"]])

## ---------------------------------------------------------------------------------------------------------------------
cp_smlCandidates <-
    names(cpModels[["sml"]])[c(25, 24, 15, 19, 20, 10, 14, 22, 74, 21)]
cp_smlCandidates

## ---- eval = F--------------------------------------------------------------------------------------------------------
#  plot(cpModels[["sml"]], specificModel = cp_smlCandidates)

## ---------------------------------------------------------------------------------------------------------------------
cp_sml <- cpModels[["sml"]][[cp_smlCandidates[1]]]

## ---------------------------------------------------------------------------------------------------------------------
cp_med <- cpModels[["med"]][["dist: weibull; l ~ Visibility; s ~ Season"]]
cp_lrg <- cpModels[["lrg"]][["dist: exponential; l ~ Visibility + Season; NULL"]]
cp_bat <- cpModels[["bat"]][["dist: weibull; l ~ Visibility + Season; s ~ 1"]]

## ---------------------------------------------------------------------------------------------------------------------
cpMods <- list(
  sml = cp_sml,
  med = cp_med,
  lrg = cp_lrg,
  bat = cp_bat
)

## ----Mhat plot, fig.height = 4, fig.width = 7, fig.align = 'center'---------------------------------------------------
Mhat <- estM(nsim = 1000, data_CO = data_CO, data_SS = data_SS, frac = 0.23,
  data_DWP = data_DWP, model_SE = pkMods, model_CP = cpMods,
  sizeCol = "Size", unitCol = "Turbine", COdate = "DateFound")

summary(Mhat)
plot(Mhat)

## ----Species Group Plot, fig.height = 5, fig.width = 5, fig.align = 'center'------------------------------------------
M_speciesGroup <- calcSplits(M = Mhat,
  split_CO = "SpeciesGroup",  data_CO = data_CO)
summary(M_speciesGroup)
plot(M_speciesGroup)

## ----Split Species and Season, fig.height = 12, fig.width = 4, fig.align = 'center'-----------------------------------
M_speciesseason <- calcSplits(M = Mhat,
  split_CO = "Species",  data_CO = data_CO, split_SS = "Season", data_SS = data_SS)
summary(M_speciesseason)
plot(M_speciesseason)

## ----Transposed Species Season, fig.height = 7, fig.width = 7, fig.align = 'center'-----------------------------------
plot(transposeSplits(M_speciesseason))

