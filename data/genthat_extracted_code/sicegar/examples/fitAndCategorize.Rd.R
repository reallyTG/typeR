library(sicegar)


### Name: fitAndCategorize
### Title: Fit and categorize.
### Aliases: fitAndCategorize

### ** Examples

# Example 1
time <- seq(3, 24, 0.5)

#simulate intensity data and add noise
noise_parameter <- 0.2
intensity_noise <- stats::runif(n = length(time), min = 0, max = 1) * noise_parameter
intensity <- sicegar::doublesigmoidalFitFormula(time,
                                               finalAsymptoteIntensityRatio = .3,
                                               maximum = 4,
                                               slope1Param = 1,
                                               midPoint1Param = 7,
                                               slope2Param = 1,
                                               midPointDistanceParam = 8)
intensity <- intensity + intensity_noise

dataInput <- data.frame(intensity = intensity, time = time)

fitObj <- sicegar::fitAndCategorize(dataInput = dataInput)




