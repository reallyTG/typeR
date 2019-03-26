library(RMOA)


### Name: MOAoptions
### Title: Get and set options for models build with MOA.
### Aliases: MOAoptions

### ** Examples

control <- MOAoptions(model = "HoeffdingTree")
control
MOAoptions(model = "HoeffdingTree", leafprediction = "MC", 
   removePoorAtts = TRUE, binarySplits = TRUE, tieThreshold = 0.20)

## Other models known by RMOA
RMOA:::.moaknownmodels

## Classification Trees
MOAoptions(model = "AdaHoeffdingOptionTree")
MOAoptions(model = "ASHoeffdingTree")
MOAoptions(model = "DecisionStump")
MOAoptions(model = "HoeffdingAdaptiveTree")
MOAoptions(model = "HoeffdingOptionTree")
MOAoptions(model = "HoeffdingTree")
MOAoptions(model = "LimAttHoeffdingTree")
MOAoptions(model = "RandomHoeffdingTree")
## Classification using Bayes rule
MOAoptions(model = "NaiveBayes")
MOAoptions(model = "NaiveBayesMultinomial")
## Classification using Active learning
MOAoptions(model = "ActiveClassifier")
## Classification using Ensemble learning
MOAoptions(model = "AccuracyUpdatedEnsemble")
MOAoptions(model = "AccuracyWeightedEnsemble")
MOAoptions(model = "ADACC")
MOAoptions(model = "DACC")
MOAoptions(model = "LeveragingBag")
MOAoptions(model = "OCBoost")
MOAoptions(model = "OnlineAccuracyUpdatedEnsemble")
MOAoptions(model = "OzaBag")
MOAoptions(model = "OzaBagAdwin")
MOAoptions(model = "OzaBagASHT")
MOAoptions(model = "OzaBoost")
MOAoptions(model = "OzaBoostAdwin")
MOAoptions(model = "TemporallyAugmentedClassifier")
MOAoptions(model = "WeightedMajorityAlgorithm")

## Regressions
MOAoptions(model = "AMRulesRegressor")
MOAoptions(model = "FadingTargetMean")
MOAoptions(model = "FIMTDD")
MOAoptions(model = "ORTO")
MOAoptions(model = "Perceptron")
MOAoptions(model = "SGD")
MOAoptions(model = "TargetMean")

## Recommendation engines
MOAoptions(model = "BRISMFPredictor")
MOAoptions(model = "BaselinePredictor")



