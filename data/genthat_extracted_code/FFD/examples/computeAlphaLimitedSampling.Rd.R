library(FFD)


### Name: computeAlphaLimitedSampling
### Title: FUNCTION to compute the average alpha-error (= error of first
###   kind) for limited sampling.
### Aliases: computeAlphaLimitedSampling
### Keywords: methods

### ** Examples

data(sheepData)
alphaList <- computeAlphaLimitedSampling(stockSizeVector = 
    sheepData$nSheep, sampleSizeLtd = 7, 
    intraHerdPrevalence = 0.2, diagSensitivity = 0.9, 
    diagSpecificity = 1)



