library(ecospat)


### Name: ecospat.boyce
### Title: Calculate Boyce Index
### Aliases: ecospat.boyce

### ** Examples

obs <- (ecospat.testData$glm_Saxifraga_oppositifolia
[which(ecospat.testData$Saxifraga_oppositifolia==1)])

ecospat.boyce (fit = ecospat.testData$glm_Saxifraga_oppositifolia , obs, nclass=0, 
window.w="default", res=100, PEplot = TRUE)



