library(PredPsych)


### Name: ClassPerm
### Title: Permutation Analysis for classification
### Aliases: ClassPerm

### ** Examples

# perform a permutation testing for 10% of the kinematics movement data#' 
# not run
# PermutationResult <- ClassPerm(Data = KinData, classCol = 1,
# selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112), nSims = 1000,cvType = "holdout")
# Output:
# Performing Permutation Analysis for Classification
#
# Performing Cross-validation
#
# Performing holdout Cross-validation 
# genclassifier was not specified, 
#  Using default value of Classifier.svm (genclassifier = Classifier.svm)
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
# 
# Performing permutation testing...
# Performing 1000 simulations 
# |=======================================================
# ==================================================================|100%
#                      Completed after 2 m 
# The p-value of the permutation testing is 0.001
# p-value generated using the approximate method for p-value calculation. 
# See Phipson, B. & Gordon K., S. (2010) for details


# Using LinearDA instead as function
# not run
# PermutationResult <- ClassPerm(Data = KinData, classCol = 1,
# selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112), nSims = 1000,classifierFun = LinearDA)


# Any minimalistic function can be used 
# The ClassPerm function sends the dataframe Data, classCol, 
# selectedCols as arguments
# not run
# myMinimalFun <- function(...){
# ***Calculate Error function as you want***
# return(accTest)
# } 
# Use the function for permutation testing e.g.
# Results <- ClassPerm(Data = KinData, classCol=1,
# selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112), 
# nSims = 1000,classifierFun = myMinimalFun)






