## ---- eval = FALSE-------------------------------------------------------
#  install.packages("driftR")
#  library(driftR)

## ----gh-installation, eval = FALSE---------------------------------------
#  install.packages("devtools")
#  devtools::install_github("shaughnessyar/driftR")

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_read(file = "sondeData.csv", instrument = "Sonde",
#                         defineVar = TRUE, cleanVar = TRUE, case = "snake")

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_read(file = system.file("extdata", "rawData.csv", package = "driftR"),
#                         instrument = "Sonde", defineVar = TRUE, cleanVar= TRUE, case = "snake")

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_factor(waterTibble, corrFactor = corfac, dateVar= Date,
#                           timeVar = Time, keepDateTime = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_correctOne(waterTibble, sourceVar = SpCond, cleanVar = SpCond_corr,
#                             calVal = 1.07, calStd = 1, factorVar = corfac)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- dr_correctTwo(waterTibble, sourceVar = pH, cleanVar = pH_corr, calValLow = 7.01,
#                             calStdLow = 7, calValHigh = 11.8, calStdHigh = 10, factorVar = corfac)

## ---- eval=FALSE---------------------------------------------------------
#  # drop all data from the begining and end
#  waterTibble <- dr_drop(waterTibble, head = 6, tail = 6)
#  
#  # drop all data over the date range
#  waterTibble <- dr_drop(waterTibble, dateVar = Date, timeVar = Time,
#                         from = "2018-01-03", to = "2018-01-06")
#  waterTibble <- dr_drop(waterTibble, dateVar = Date, timeVar = Time, to = "2018-01-06")
#  waterTibble <- dr_drop(waterTibble, dateVar = Date, timeVar = Time, from = "2018-01-03")
#  
#  #drop all data for observations that match the expression
#  waterTibble <- dr_drop(waterTibble, exp = SpCond > 9000)
#  waterTibble <- dr_drop(waterTibble, exp = turbidity < 0)
#  waterTibble <- dr_drop(waterTibble, exp = pH >= 9)

## ---- eval=FALSE---------------------------------------------------------
#  # replace only the data from one variable over a date range
#  waterTibble <- dr_replace(waterTibble, sourceVar = pH, overwrite = TRUE,
#                            dateVar = Date, timeVar = Time, from = "2018-01-03", to = "2018-01-06")
#  waterTibble <- dr_replace(waterTibble, sourceVar = pH, cleanVar = pH_NA, overwrite = FALSE,
#                            dateVar = Date, timeVar = Time, from = "2018-01-03", to = "2018-01-06")
#  
#  # replace only the data from one variable using an expression
#  waterTibble <- dr_replace(waterTibble, sourceVar = pH, overwrite = TRUE, exp = pH >= 9)
#  waterTibble <- dr_replace(waterTibble, sourceVar = turbidity, cleanVar = turbidity_NA,
#                            overwrite = FALSE, exp = turbidity < 0)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- rename(Turbidity = `Turbidity.`)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- select(waterTibble, Date, Time, dateTime, SpCond, SpCond_Corr, pH, pH_Corr, pHmV,
#               Chloride, Chloride_Corr, AmmoniumN, AmmoniumN_Corr, NitrateN, NitrateN_Corr,
#               Turbidity, Turbidity_Corr, DO, DO_Corr, corfac)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- select(waterTibble, -NitrateN)

## ---- eval=FALSE---------------------------------------------------------
#  waterTibble <- select(waterTibble, -c(NitrateN, pHmV))

## ---- eval=FALSE---------------------------------------------------------
#  write_csv(df, path = "waterData.csv", na = "NA")

## ---- eval=FALSE---------------------------------------------------------
#  # load needed packages
#  library(driftR)
#  library(dplyr)
#  library(readr)
#  
#  # import data exported from a Sonde
#  # example file located in the package
#  waterTibble <- dr_read(file = system.file("extdata", "rawData.csv", package="driftR"),
#                              instrument = "Sonde", define = TRUE)
#  
#  # calculate correction factors
#  # results stored in new vector corrFac
#  waterTibble <- dr_factor(waterTibble, corrFactor = corrFac, dateVar = Date,
#                           timeVar = Time, keepDateTime = TRUE)
#  
#  # apply one-point calibration to SpCond;
#  # results stored in new vector SpConde_Corr
#  waterTibble <- dr_correctOne(waterTibble, sourceVar = SpCond, cleanVar = SpCond_Corr,
#                               calVal = 1.07, calStd = 1, factorVar = corrFac)
#  
#  # apply one-point calibration to Turbidity.;
#  # results stored in new vector Turbidity_Corr
#  waterTibble <- rename(waterTibble, Turbidity = `Turbidity.`)
#  waterTibble <- dr_correctOne(waterTibble, sourceVar = Turbidity, cleanVar = Turbidity_Corr,
#                      calVal = 1.3, calStd = 0, factorVar = corrFac)
#  
#  # apply one-point calibration to DO;
#  # results stored in new vector DO_Corr
#  waterTibble <- dr_correctOne(waterTibble, sourceVar = DO, cleanVar = DO_Corr,
#                               calVal = 97.6, calStd = 99, factorVar = corrFac)
#  
#  # apply two-point calibration to pH;
#  # results stored in new vector ph_Corr
#  waterTibble <- dr_correctTwo(waterTibble, sourceVar = pH, cleanVar = pH_Corr,
#                               calValLow = 7.01, calStdLow = 7, calValHigh = 11.8,
#                               calStdHigh =  10, factorVar = corrFac)
#  
#  # apply two-point calibration to Chloride;
#  # results stored in new vector Chloride_Corr
#  waterTibble <- dr_correctTwo(waterTibble, sourceVar = Chloride, cleanVar = Chloride_Corr,
#                               calValLow = 11.6, calStdLow = 10, calValHigh = 1411,
#                               calStdHigh =  1000, factorVar = corrFac)
#  
#  # drop observations to account for instrument equilibration
#  waterTibble <- dr_drop(waterTibble, head=6, tail=6)
#  
#  # replace the pH data in the specified date range with NA
#  waterTibble <- dr_replace(waterTibble, sourceVar = pH, overwite = TRUE, dateVar = Date,
#                            timeVar = Time, from = "2018-02-05", to = "2018-02-09")
#  
#  # reorder variables
#  waterTibble <- select(waterTibble, Date, Time, dateTime, SpCond, SpCond_Corr, pH, pH_Corr, pHmV,
#                        Chloride, Chloride_Corr, AmmoniumN, NitrateN, Turbidity, Turbidity_Corr,
#                        DO, DO_Corr, corrFac)
#  
#  # export cleaned data
#  write_csv(waterTibble, path = "waterData.csv", na = "NA")

