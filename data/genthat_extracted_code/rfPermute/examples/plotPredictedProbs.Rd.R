library(rfPermute)


### Name: plotPredictedProbs
### Title: Plot Predicted Probabilities
### Aliases: plotPredictedProbs

### ** Examples

data(mtcars)

rf <- randomForest(factor(am) ~ ., mtcars)
plotPredictedProbs(rf, bins = 20)




