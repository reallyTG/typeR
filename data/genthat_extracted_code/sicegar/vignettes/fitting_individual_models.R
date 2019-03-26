## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----install packages, echo=FALSE, warning=FALSE, results='hide',message=FALSE----

###*****************************
seedNo=14159
set.seed(seedNo)
###*****************************

###*****************************
require("sicegar")
require("dplyr")
require("ggplot2")
###*****************************

## ----generate data for double - sigmoidal--------------------------------
time <- seq(3, 24, 0.5)
noise_parameter <- 0.2
intensity_noise <- runif(n = length(time), min = 0, max = 1) * noise_parameter
intensity <- doublesigmoidalFitFormula(time,
                                       finalAsymptoteIntensityRatio = .3,
                                       maximum = 4,
                                       slope1Param = 1,
                                       midPoint1Param = 7,
                                       slope2Param = 1,
                                       midPointDistanceParam = 8)
intensity <- intensity + intensity_noise
dataInput <- data.frame(time, intensity)
head(dataInput) # the generated input data

## ----normalize_data------------------------------------------------------
normalizedInput <- normalizeData(dataInput = dataInput, 
                                 dataInputName = "doubleSigmoidalSample")
head(normalizedInput$timeIntensityData) # the normalized time and intensity data

## ----normalized_data_output----------------------------------------------
normalizedInput$dataScalingParameters # scaling parameters
normalizedInput$dataInputName # data input name

## ----time normalization, eval=FALSE--------------------------------------
#  timeRange <- time
#  timeNormalized <- time/timeRange # normalized time values

## ----intensity normalization, eval=FALSE---------------------------------
#  intensityMin <- min(intensity)
#  intensityMax <- max(intensity)
#  intensityRange <- intensityMax - intensityMin
#  
#  intensityNormalized <- (intensity-intensityMin)/intensityRange # normalized intensity values

## ------------------------------------------------------------------------
# Do the sigmoidal fit
sigmoidalModel <- multipleFitFunction(dataInput=normalizedInput,
                                      model="sigmoidal")


# Do the double-sigmoidal fit
doubleSigmoidalModel <- multipleFitFunction(dataInput=normalizedInput,
                                            model="doublesigmoidal")

## ----parameter vectors---------------------------------------------------
t(sigmoidalModel)
t(doubleSigmoidalModel)

