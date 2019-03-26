library(RMOA)


### Name: MOA_classification_trees
### Title: MOA classification trees
### Aliases: MOA_classification_trees AdaHoeffdingOptionTree
###   ASHoeffdingTree DecisionStump HoeffdingAdaptiveTree
###   HoeffdingOptionTree HoeffdingTree LimAttHoeffdingTree
###   RandomHoeffdingTree

### ** Examples

ctrl <- MOAoptions(model = "HoeffdingTree", leafprediction = "MC", 
   removePoorAtts = TRUE, binarySplits = TRUE, tieThreshold = 0.20)
hdt <- HoeffdingTree(control=ctrl)
hdt
hdt <- HoeffdingTree(numericEstimator = "GaussianNumericAttributeClassObserver")
hdt



