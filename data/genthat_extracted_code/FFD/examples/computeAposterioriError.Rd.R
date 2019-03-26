library(FFD)


### Name: computeAposterioriError
### Title: FUNCTION to compute the a-posteriori error.
### Aliases: computeAposterioriError
### Keywords: misc

### ** Examples

## Freedom from disease using limited sampling with sampleSizeLtd = 7.
## Data: sheep holdings in state "Steiermark".
######################################################################
data(sheepData)
popVec <- sheepData$nSheep[sheepData$state == 6]
N1 <- length(popVec)
sampleSizeLtd <- 7
intraHerdPrev <- 0.13
designPrev <- 0.002
nDiseased <- round(designPrev*N1)
## Draw the sample:
n1 <- 1560
samplePop <- sample(x = popVec, size = n1, replace = FALSE, prob = NULL)
## Compute alpha-errors for the sample:
alphaList <- computeAlphaLimitedSampling(stockSizeVector = samplePop, 
        sampleSizeLtd = sampleSizeLtd, 
        intraHerdPrevalence = intraHerdPrev, 
        diagSensitivity = 0.9, diagSpecificity = 1)
alphaDataFrame <- merge(x = data.frame(size = samplePop), 
    y = alphaList$alphaDataFrame, by = "size", all.x = TRUE, all.y = FALSE)
## Compute the a-posteriori alpha-error:
alphaAPostApprox <- computeAposterioriError(alphaErrorVector = 
    alphaDataFrame$alpha, nPopulation = N1, nDiseased = nDiseased,
    method = "approx")
alphaAPostExact <- computeAposterioriError(alphaErrorVector = 
    alphaDataFrame$alpha, nPopulation = N1, nDiseased = nDiseased,
    method = "exact")



