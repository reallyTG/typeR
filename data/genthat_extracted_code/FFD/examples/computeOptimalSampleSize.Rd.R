library(FFD)


### Name: computeOptimalSampleSize
### Title: FUNCTION to compute the optimal sample size.
### Aliases: computeOptimalSampleSize
### Keywords: misc

### ** Examples

## Compute the number of herds to be tested for limited sampling
## with sampleSizeLtd = 7:
#################################################################
data(sheepData)
## Compute the average herd sensitivity:
alphaList <- computeAlphaLimitedSampling(stockSizeVector = 
    sheepData$nSheep, sampleSizeLtd = 7, 
    intraHerdPrevalence = 0.13, diagSensitivity = 0.9, 
    diagSpecificity = 1)
sensHerd <- 1 - alphaList$meanAlpha
## Number of herds to be tested:
nHerds <- computeOptimalSampleSize(nPopulation = dim(sheepData)[1], 
    prevalence = 0.002, alpha = 0.05, sensitivity = sensHerd, 
    specificity = 1)

## Compute the number of animals to be tested for individual 
## sampling:
#################################################################
sampleSizeIndividual <- computeOptimalSampleSize(nPopulation = 300, 
    prevalence = 0.2, alpha = 0.05, sensitivity = 0.97, 
    specificity = 1, lookupTable = TRUE)




