library(InformationValue)


### Name: misClassError
### Title: misClassError
### Aliases: misClassError

### ** Examples

data('ActualsAndScores')
misClassError(actuals=ActualsAndScores$Actuals,
  predictedScores=ActualsAndScores$PredictedScores, threshold=0.5)



