library(RMOA)


### Name: MOA_classifier
### Title: Create a MOA classifier
### Aliases: MOA_classifier

### ** Examples

RMOA:::.moaknownmodels
ctrl <- MOAoptions(model = "HoeffdingTree", leafprediction = "MC", 
   removePoorAtts = TRUE, binarySplits = TRUE, tieThreshold = 0.20)
hdt <- MOA_classifier(model = "HoeffdingTree", control=ctrl)
hdt
hdt <- MOA_classifier(
 model = "HoeffdingTree", 
 numericEstimator = "GaussianNumericAttributeClassObserver")
hdt



