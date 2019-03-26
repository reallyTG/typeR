library(sicegar)


### Name: doublesigmoidalFitFormula
### Title: Double Sigmoidal Formula
### Aliases: doublesigmoidalFitFormula

### ** Examples

time <- seq(3, 24, 0.1)

#simulate intensity data and add noise
noise_parameter <- 0.2
intensity_noise <- stats::runif(n = length(time), min = 0, max = 1) * noise_parameter
intensity <- doublesigmoidalFitFormula(time,
                                      finalAsymptoteIntensityRatio = .3,
                                      maximum = 4,
                                      slope1Param = 1,
                                      midPoint1Param = 7,
                                      slope2Param = 1,
                                      midPointDistanceParam = 8)
intensity <- intensity + intensity_noise

dataInput <- data.frame(intensity = intensity, time = time)
normalizedInput <- normalizeData(dataInput)
parameterVector <- doublesigmoidalFitFunction(normalizedInput, tryCounter = 2)


#Check the results
if(parameterVector$isThisaFit){
 intensityTheoretical <-
       doublesigmoidalFitFormula(
               time,
               finalAsymptoteIntensityRatio = parameterVector$finalAsymptoteIntensityRatio_Estimate,
               maximum = parameterVector$maximum_Estimate,
               slope1Param = parameterVector$slope1Param_Estimate,
               midPoint1Param = parameterVector$midPoint1Param_Estimate,
               slope2Param = parameterVector$slope2Param_Estimate,
               midPointDistanceParam = parameterVector$midPointDistanceParam_Estimate)

 comparisonData <- cbind(dataInput, intensityTheoretical)

 require(ggplot2)
 ggplot(comparisonData) +
   geom_point(aes(x = time, y = intensity)) +
   geom_line(aes(x = time, y = intensityTheoretical)) +
   expand_limits(x = 0, y = 0)
   }

if(!parameterVector$isThisaFit){
  print(parameterVector)
  }





