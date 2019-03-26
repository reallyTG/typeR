library(sicegar)


### Name: preCategorize
### Title: Checks for signal in the data.
### Aliases: preCategorize

### ** Examples

# Example 1 with double sigmoidal data

time=seq(3, 24, 0.1)

#simulate intensity data and add noise
noise_parameter = 0.2
intensity_noise = runif(n = length(time), min = 0, max = 1) * noise_parameter
intensity = sicegar::doublesigmoidalFitFormula(time,
                                              finalAsymptoteIntensityRatio = .3,
                                              maximum = 4,
                                              slope1Param = 1,
                                              midPoint1Param = 7,
                                              slope2Param = 1,
                                              midPointDistanceParam = 8)
intensity <- intensity + intensity_noise

dataInput <- data.frame(intensity = intensity, time = time)
normalizedInput <- sicegar::normalizeData(dataInput, dataInputName = "sample001")
isThis_nosignal <- sicegar::preCategorize(normalizedInput = normalizedInput)



# Example 2 with no_signal data

time <- seq(3, 24, 0.1)

#simulate intensity data and add noise
noise_parameter <- 0.05
intensity_noise <- runif(n = length(time), min = 0, max = 1) * noise_parameter * 2e-04
intensity <- sicegar::doublesigmoidalFitFormula(time,
                                               finalAsymptoteIntensityRatio = .3,
                                               maximum = 2e-04,
                                               slope1Param = 1,
                                               midPoint1Param = 7,
                                               slope2Param = 1,
                                               midPointDistanceParam = 8)
intensity <- intensity + intensity_noise

dataInput <- data.frame(intensity=intensity, time=time)
normalizedInput <- sicegar::normalizeData(dataInput,dataInputName = "sample001")
isThis_nosignal <- sicegar::preCategorize(normalizedInput = normalizedInput)




