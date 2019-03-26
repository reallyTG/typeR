library(ecospat)


### Name: ecospat.mpa
### Title: Minimal Predicted Area
### Aliases: ecospat.mpa

### ** Examples

obs <- (ecospat.testData$glm_Saxifraga_oppositifolia
[which(ecospat.testData$Saxifraga_oppositifolia==1)])

ecospat.mpa(obs)
ecospat.mpa(obs,perc=1) ## 100 percent of the presences encompassed



