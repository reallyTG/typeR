library(PredPsych)


### Name: LinearDA
### Title: Cross-validated Linear Discriminant Analysis
### Aliases: LinearDA

### ** Examples

# simple model with holdout data partition of 80% and no extended results 
LDAModel <- LinearDA(Data = KinData, classCol = 1, 
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),cvType="holdout")
# Output:
#
# Performing Linear Discriminant Analysis
#
#
# Performing holdout Cross-validation
# 
# cvFraction was not specified,
#  Using default value of 0.8 (80%) fraction for training (cvFraction = 0.8)
# 
# Proportion of Test/Train Data was :  0.2470588 
# Predicted
# Actual  1  2
# 1 51 32
# 2 40 45
# [1] "Test holdout Accuracy is 0.57"
# holdout LDA Analysis: 
# cvFraction : 0.8 
# Test Accuracy 0.57
# *Legend:
# cvFraction = Fraction of data to keep for training data 
# Test Accuracy = mean accuracy from the Testing dataset

# alt uses:
# holdout cross-validation with 80% training data
LDAModel <- LinearDA(Data = KinData, classCol = 1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),
CV=FALSE,cvFraction = 0.8,extendedResults = TRUE,cvType="holdout")

# For a 10 fold cross-validation without outputting messages 
LDAModel <-  LinearDA(Data = KinData, classCol = 1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),
extendedResults = FALSE,cvType = "folds",nTrainFolds=10,silent = TRUE)




