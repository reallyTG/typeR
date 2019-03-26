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
require("cowplot")
###*****************************

## ----fig.height=4, fig.width=4-------------------------------------------
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
intensity <- intensity+intensity_noise
dataInput <- data.frame(time, intensity)

ggplot(dataInput, aes(time, intensity)) + geom_point() + theme_bw()

## ------------------------------------------------------------------------
fitObj <- fitAndCategorize(dataInput,
                           threshold_minimum_for_intensity_maximum = 0.3,
                           threshold_intensity_range = 0.1,
                           threshold_t0_max_int = 0.05)

## ----fig.height=4, fig.width=8-------------------------------------------
# Double-sigmoidal fit with parameter related lines
fig_a <- figureModelCurves(dataInput = fitObj$normalizedInput,
                                  sigmoidalFitVector = fitObj$sigmoidalModel,
                                  showParameterRelatedLines = TRUE)

fig_b <- figureModelCurves(dataInput = fitObj$normalizedInput,
                                  doubleSigmoidalFitVector = fitObj$doubleSigmoidalModel,
                                  showParameterRelatedLines = TRUE)

plot_grid(fig_a, fig_b, ncol = 2) # function from the cowplot package

## ------------------------------------------------------------------------
fitObj$decisionProcess$decision # final decision

## ------------------------------------------------------------------------
names(fitObj)

## ----The results of the double_sigmoidal fit-----------------------------
str(fitObj$summaryVector)

