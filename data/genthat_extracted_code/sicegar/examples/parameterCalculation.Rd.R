library(sicegar)


### Name: parameterCalculation
### Title: useful paramter calculation with help of fits
### Aliases: parameterCalculation

### ** Examples

time <- seq(3, 24, 0.1)

#simulate intensity data with noise
noise_parameter <- 0.2
intensity_noise <- stats::runif(n = length(time), min = 0, max = 1) * noise_parameter
intensity <- sicegar::doublesigmoidalFitFormula(time,
                                            finalAsymptoteIntensityRatio = .3,
                                            maximum = 4,
                                            slope1Param = 1,
                                            midPoint1Param = 7,
                                            slope2Param = 1,
                                            midPointDistanceParam = 8)
intensity <- intensity+intensity_noise

dataInput <- data.frame(intensity = intensity, time = time)
normalizedInput <- sicegar::normalizeData(dataInput)
parameterVector <- sicegar::multipleFitFunction(dataInput = normalizedInput,
                                            dataInputName = "sample01",
                                            model = "doublesigmoidal",
                                            n_runs_min = 20,
                                            n_runs_max = 500,
                                            showDetails = FALSE)

if(parameterVector$isThisaFit){
       parameterVector <- sicegar::parameterCalculation(parameterVector)
}

print(t(parameterVector))




