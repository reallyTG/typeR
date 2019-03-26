library(PredPsych)


### Name: classifyFun
### Title: Generic Classification Analyses
### Aliases: classifyFun

### ** Examples

# classification analysis with SVM
Results <- classifyFun(Data = KinData,classCol = 1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),cvType="holdout")

# Output:

# Performing Classification Analysis
#
# Performing holdout Cross-validation
# genclassifier was not specified, 
#   Using default value of Classifier.svm (genclassifier = Classifier.svm)"
# 
# cvFraction was not specified, 
#  Using default value of 0.8 (cvFraction = 0.8)
# 
# Proportion of Test/Train Data was :  0.2470588 
# [1] "Test holdout Accuracy is  0.65"
# holdout classification Analysis: 
# cvFraction : 0.8 
# Test Accuracy 0.65
# *Legend:
# cvFraction = Fraction of data to keep for training data 
# Test Accuracy = Accuracy from the Testing dataset

# Alternate uses:
# perform a k-folds cross-validated classification analysis:
Results <- classifyFun(Data = KinData,classCol = 1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),cvType = "folds")

# use extendedResults as well as tuning
Results <- classifyFun(Data = KinData,classCol = 1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),
cvType = "folds",extendedResults = TRUE,tune=TRUE)






