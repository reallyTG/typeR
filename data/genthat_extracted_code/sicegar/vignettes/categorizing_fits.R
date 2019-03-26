## ----setup, include=FALSE------------------------------------------------
  knitr::opts_chunk$set(echo = TRUE)

## ----install packages, echo=FALSE, warning=FALSE, results='hide', message=FALSE----

###*****************************
# INITIAL COMMANDS TO RESET THE SYSTEM
rm(list = ls())
if (is.integer(dev.list())){dev.off()}
cat("\014")
seedNo=14159
set.seed(seedNo)
###*****************************

###*****************************
require(sicegar)
require(dplyr)
require(cowplot)
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

## ------------------------------------------------------------------------
normalizedInput <- normalizeData(dataInput = dataInput, 
                                                dataInputName = "doubleSigmoidalSample")

# Fit sigmoidal model
sigmoidalModel <- multipleFitFunction(dataInput = normalizedInput,
                                          model = "sigmoidal",
                                          n_runs_min = 20,
                                          n_runs_max = 500,
                                          showDetails = FALSE)

# Fit double-sigmoidal model
doubleSigmoidalModel <- multipleFitFunction(dataInput = normalizedInput,
                                                model = "doublesigmoidal",
                                                n_runs_min = 20,
                                                n_runs_max = 500,
                                                showDetails = FALSE)

## ----linear sigmoidal amd double-sigmoidal fits to double-sigmoidal data----
# Calculate additional parameters
sigmoidalModel <- parameterCalculation(sigmoidalModel)

# Calculate additional parameters
doubleSigmoidalModel <- parameterCalculation(doubleSigmoidalModel)

## ----echo=FALSE, warning=FALSE, message=FALSE, fig.width=7---------------
f1 <- figureModelCurves(dataInput = normalizedInput,
                        sigmoidalFitVector = sigmoidalModel,
                        showParameterRelatedLines = TRUE)

f2 <- figureModelCurves(dataInput = normalizedInput,
                        doubleSigmoidalFitVector = doubleSigmoidalModel,
                        showParameterRelatedLines = TRUE)

plot_grid(f1, f2)

## ------------------------------------------------------------------------
# now we can categorize the fits
decisionProcess <- categorize(threshold_minimum_for_intensity_maximum = 0.3,
                                      threshold_intensity_range = 0.1,
                                      threshold_t0_max_int = 0.05,
                                      parameterVectorSigmoidal = sigmoidalModel,
                                      parameterVectorDoubleSigmoidal = doubleSigmoidalModel)

## ------------------------------------------------------------------------
print(decisionProcess$decision)

