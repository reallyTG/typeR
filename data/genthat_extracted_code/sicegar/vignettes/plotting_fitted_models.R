## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----install packages, echo=FALSE, warning=FALSE, results='hide',message=FALSE----

###*****************************
# INITIAL COMMANDS TO RESET THE SYSTEM
seedNo=14159
set.seed(seedNo)
###*****************************

###*****************************
require("sicegar")
require("dplyr")
require("ggplot2")
require("cowplot")
###*****************************

## ------------------------------------------------------------------------
# simulate sigmoidal data
time <- seq(3, 24, 0.5)

noise_parameter <- 0.1
intensity_noise <- runif(n = length(time), min = 0, max = 1) * noise_parameter
intensity <- sigmoidalFitFormula(time, maximum = 4, slope = 1, midPoint = 8)
intensity <- intensity + intensity_noise
dataInputSigmoidal <- data.frame(intensity = intensity, time = time)

# simulate double-sigmoidal data
noise_parameter <- 0.2
intensity_noise <- runif(n = length(time),min = 0,max = 1) * noise_parameter
intensity <- doublesigmoidalFitFormula(time,
                                    finalAsymptoteIntensityRatio = .3,
                                    maximum = 4,
                                    slope1 = 1,
                                    midPoint1Param = 7,
                                    slope2 = 1,
                                    midPointDistanceParam = 8)
intensity <- intensity + intensity_noise
dataInputDoubleSigmoidal <- data.frame(intensity = intensity, time = time)

# fit models to both datasets
fitObj_sm <- fitAndCategorize(dataInput = dataInputSigmoidal)
fitObj_dsm <- fitAndCategorize(dataInput = dataInputDoubleSigmoidal)

## ----plot raw data, echo=TRUE, fig.height=4, fig.width=6-----------------
# sigmoidal raw data only
figureModelCurves(dataInput = fitObj_sm$normalizedInput)

# double-sigmoidal raw data only
figureModelCurves(dataInput = fitObj_dsm$normalizedInput)

## ----plot raw data and fit, echo=TRUE, message=FALSE, warning=FALSE, comment=FALSE, fig.height=4, fig.width=6----
# sigmoidal fit
figureModelCurves(dataInput = fitObj_sm$normalizedInput,
                  sigmoidalFitVector = fitObj_sm$sigmoidalModel)

# double-sigmoidal fit
figureModelCurves(dataInput = fitObj_dsm$normalizedInput,
                  doubleSigmoidalFitVector = fitObj_dsm$doubleSigmoidalModel)

## ----plot raw data and fit with parameter related lines, echo=TRUE, message=FALSE, warning=FALSE, comment=FALSE, fig.height=4, fig.width=6----
# sigmoidal fit with parameter related lines
figureModelCurves(dataInput = fitObj_sm$normalizedInput,
                  sigmoidalFitVector = fitObj_sm$sigmoidalModel,
                  showParameterRelatedLines = TRUE)

# double-sigmoidal fit with parameter related lines
figureModelCurves(dataInput = fitObj_dsm$normalizedInput,
                  doubleSigmoidalFitVector = fitObj_dsm$doubleSigmoidalModel,
                  showParameterRelatedLines = TRUE)

