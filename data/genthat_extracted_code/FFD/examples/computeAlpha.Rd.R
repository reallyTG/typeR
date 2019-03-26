library(FFD)


### Name: computeAlpha
### Title: FUNCTION to compute the herd-based alpha-errors (= 1 - herd
###   sensitivity).
### Aliases: computeAlpha
### Keywords: methods

### ** Examples

data(sheepData)
## Compute the herd sensitivities usinh limited sampling:
alphaVec <- computeAlpha(nAnimalVec = sheepData$nSheep, 
    method = "limited", sampleSizeLtd = 7, 
    intraHerdPrevalence = 0.2, diagSensitivity = 0.9)




