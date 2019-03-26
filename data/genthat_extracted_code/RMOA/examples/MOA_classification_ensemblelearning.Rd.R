library(RMOA)


### Name: MOA_classification_ensemblelearning
### Title: MOA classification using ensembles
### Aliases: MOA_classification_ensemblelearning AccuracyUpdatedEnsemble
###   AccuracyWeightedEnsemble ADACC DACC LeveragingBag LimAttClassifier
###   OCBoost OnlineAccuracyUpdatedEnsemble OzaBag OzaBagAdwin OzaBagASHT
###   OzaBoost OzaBoostAdwin TemporallyAugmentedClassifier
###   WeightedMajorityAlgorithm

### ** Examples

ctrl <- MOAoptions(model = "OzaBoostAdwin")
mymodel <- OzaBoostAdwin(control=ctrl)
mymodel



