## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

rm(list = ls())

library(GenEst)
vers <- packageVersion("GenEst")
today <- Sys.Date()
set.seed(951)

## ------------------------------------------------------------------------
data(solar_PV)
names(solar_PV)

## ----pk data-------------------------------------------------------------
data_SE <- solar_PV$SE
head(data_SE)

## ----pk one model--------------------------------------------------------
SE_model <- pkm(p ~ 1, k ~ 1, data = data_SE)
SE_model


## ----pk two models-------------------------------------------------------
SE_model_set <- pkm(p~Season, k~1, data = data_SE, allCombos = TRUE)
class(SE_model_set)
length(SE_model_set)
names(SE_model_set)
class(SE_model_set[[1]])

## ----pk set AICc---------------------------------------------------------
aicc(SE_model_set)

## ----pk size set---------------------------------------------------------
SE_size_model <- pkm(p ~ Season,
                     k ~ 1,
                     sizeCol = "Size",
                     data = data_SE)
class(SE_size_model)
names(SE_size_model)  # A list is created with a model set per size class.
class(SE_size_model$small)
names(SE_size_model$small) # Each model set contains one model in this case.


## ------------------------------------------------------------------------
SE_size_model_set <- pkm(p ~ Season,
                     k ~ 1,
                     sizeCol = "Size",
                     data = data_SE, allCombos = TRUE)
aicc(SE_size_model_set)
SE_models <- list()

## ------------------------------------------------------------------------
SE_models$small <- SE_size_model_set$small[[2]]

## ----pk size Medium------------------------------------------------------
SE_models$med <- SE_size_model_set$med[[2]]

## ----pk Size Large-------------------------------------------------------
SE_models$lrg <- SE_size_model_set$lrg[[1]]

## ----cp data-------------------------------------------------------------
data_CP <- solar_PV$CP
head(data_CP)

## ----cp------------------------------------------------------------------
cpm(l ~ Season, s ~ 1, data = data_CP,
                left = "LastPresent",
                right = "FirstAbsent",
                dist = "weibull")

## ----cp set--------------------------------------------------------------
  CP_weibull_set <- cpm(l ~ Season, s ~ 1, data = data_CP,
                  left = "LastPresent",
                  right = "FirstAbsent",
                  dist = "weibull", allCombos = TRUE)
class(CP_weibull_set)
aicc(CP_weibull_set)

## ----cp Size Set---------------------------------------------------------
CP_size_model_set <- cpm(formula_l = l ~ Season,
                           formula_s = s ~ 1, 
                           left = "LastPresent",
                           right = "FirstAbsent",
                           dist = c("exponential", "weibull"),
                           sizeCol = "Size",
                           data = data_CP, allCombos = TRUE)
class(CP_size_model_set)
names(CP_size_model_set)
class(CP_size_model_set$small)
length(CP_size_model_set$small)
names(CP_size_model_set$small)

## ------------------------------------------------------------------------
aicc(CP_size_model_set)
CP_models <- list()

## ----cp Size Small-------------------------------------------------------
CP_models$small <- CP_size_model_set$small[[4]]

## ----cp size Medium------------------------------------------------------
CP_models$med <- CP_size_model_set$med[[4]]

## ----Size Large----------------------------------------------------------
CP_models$lrg <- CP_size_model_set$lrg[[2]]

## ----Load CO SS and DWP--------------------------------------------------
data_CO <- solar_PV$CO
head(data_CO)

## ----SS Data-------------------------------------------------------------
data_SS <- solar_PV$SS
data_SS[1:5 , 1:10]

## ----DWP data------------------------------------------------------------
data_DWP <- solar_PV$DWP
head(data_DWP)

## ----Arrival Times, options----------------------------------------------
  Mest <- estM(
    nsim = 100, frac = 1, 
    data_CO = data_CO, data_SS = data_SS, data_DWP = data_DWP,
    model_SE = SE_models, model_CP = CP_models,
    unitCol = "Unit", sizeCol = "Size",
    COdate = "DateFound", SSdate = "DateSearched"
  )

## ---- fig.show = "hold", fig.height = 4, fig.width = 6, fig.align = 'center'----
plot(Mest)

## ----Summary - Season----------------------------------------------------
unique(data_SS[, "Season"])

M_season <- calcSplits(M = Mest,
  split_SS = "Season", data_SS = data_SS,
  split_CO = NULL,  data_CO = data_CO
)

## ----splitFull plot, fig.height = 4, fig.width = 4, fig.align = 'center'----
plot(M_season)

## ----SplitFull Summary---------------------------------------------------
summary(M_season, CL = 0.95)

## ----Summary - Weekly----------------------------------------------------

SSdat <- prepSS(data_SS) # Creates an object of type prepSS.
schedule <- seq(from = 0, to = max(SSdat$days), by = 7)
tail(schedule)

## ----Summary - Weekly Part 2, fig.height = 4, fig.width = 7, fig.align = 'center'----
M_week <- calcSplits(M = Mest,
  split_time = schedule,
  data_SS = SSdat,
  data_CO = data_CO
)
plot(x = M_week, rate = TRUE)


## ----Summary - Unit, fig.height = 4, fig.width = 7, fig.align = 'center'----

M_unit <- calcSplits(M = Mest,
  split_CO = "Unit",
  data_CO = data_CO,
  data_SS = data_SS
)
plot(M_unit, rate = FALSE)

## ----individual unit summary---------------------------------------------
dim(summary(M_unit))  # only 164 arrays had observations.

# A list of the arrays without observed carcasses:
setdiff(paste0("Unit", 1:300), data_CO$Unit)

# Create summaries for arrays Unit12 and Unit100.
whichRow <- rownames(summary(M_unit))  %in% c("Unit12", "Unit100")
summary(M_unit)[whichRow, ]


## ----Summary - season and species, fig.height = 5, fig.width = 3, fig.align = 'center'----

M_unit_and_species <- calcSplits(M = Mest,
  split_SS = c("Season"),
  split_CO = c("Size"),
  data_CO = data_CO,
  data_SS = data_SS
)
plot(M_unit_and_species, rate = FALSE)


