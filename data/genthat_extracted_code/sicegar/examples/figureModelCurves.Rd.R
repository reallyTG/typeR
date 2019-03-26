library(sicegar)


### Name: figureModelCurves
### Title: Generate model associated figures.
### Aliases: figureModelCurves

### ** Examples

time <- seq(3, 24, 0.1)

#simulate intensity data and add noise
noise_parameter <- 0.2
intensity_noise <- runif(n = length(time), min = 0, max = 1) * noise_parameter
intensity <- sicegar::doublesigmoidalFitFormula(time,
                                               finalAsymptoteIntensityRatio = .3,
                                               maximum = 4,
                                               slope1Param = 1,
                                               midPoint1Param = 7,
                                               slope2Param = 1,
                                               midPointDistanceParam = 8)
intensity <- intensity + intensity_noise

dataInput <- data.frame(intensity = intensity, time = time)
normalizedInput <- sicegar::normalizeData(dataInput, dataInputName = "sample001")


# Do the double sigmoidal fit
doubleSigmoidalModel <- sicegar::multipleFitFunction(dataInput = normalizedInput,
                                                    model = "doublesigmoidal",
                                                    n_runs_min = 20,
                                                    n_runs_max = 500,
                                                    showDetails = FALSE)

doubleSigmoidalModel <- sicegar::parameterCalculation(doubleSigmoidalModel)

fig01 <- sicegar::figureModelCurves(dataInput = normalizedInput,
                                  doubleSigmoidalFitVector = doubleSigmoidalModel,
                                  showParameterRelatedLines = TRUE)
print(fig01)





