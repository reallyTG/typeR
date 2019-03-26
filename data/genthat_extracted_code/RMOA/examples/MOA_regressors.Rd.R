library(RMOA)


### Name: MOA_regressors
### Title: MOA regressors
### Aliases: MOA_regressors TargetMean FadingTargetMean Perceptron
###   AMRulesRegressor FIMTDD ORTO

### ** Examples

ctrl <- MOAoptions(model = "FIMTDD", DoNotDetectChanges = TRUE, noAnomalyDetection=FALSE,
   univariateAnomalyprobabilityThreshold = 0.5, verbosity = 5)
mymodel <- FIMTDD(control=ctrl)
mymodel
mymodel <- FIMTDD(ctrlDoNotDetectChanges = FALSE)
mymodel



