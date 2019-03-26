library(InformationValue)


### Name: optimalCutoff
### Title: optimalCutoff
### Aliases: optimalCutoff

### ** Examples

data('ActualsAndScores')
optimalCutoff(actuals=ActualsAndScores$Actuals,
predictedScores=ActualsAndScores$PredictedScores, optimiseFor="Both", returnDiagnostics=TRUE)



