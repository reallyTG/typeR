library(PredPsych)


### Name: DTModel
### Title: Generic Decision Tree Function
### Aliases: DTModel

### ** Examples

# generate a cart model for 10% of the data with cross-validation
model <- DTModel(Data = KinData,classCol=1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112), tree='CARTCV',cvType = "holdout")
# Output:
# Performing Decision Tree Analysis 
#
# [1] "Generating crossvalidated Tree With Missing Values"
#
# Performing holdout Cross-validation
# 
# cvFraction was not specified,
#  Using default value of 0.8 (cvFraction = 0.8)" 
# Proportion of Test/Train Data was :  0.2470588 
# 
# [1] "Test holdout Accuracy is  0.62"
# holdout CART Analysis: 
# cvFraction : 0.8 
# Test Accuracy 0.62
# *Legend:
# cvFraction = Fraction of data to keep for training data 
# Test Accuracy = Accuracy from the Testing dataset

#' # --CART MOdel --

# Alternate uses:  
# k-fold cross-validation with removing missing values
model <- DTModel(Data = KinData,classCol=1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),
tree='CARTNACV',cvType="folds")

# holdout cross-validation without removing missing values
model <- DTModel(Data = KinData,classCol=1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),
tree='CARTCV',cvType = "holdout")

# k-fold cross-validation without removing missing values
model <- DTModel(Data = KinData,classCol=1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),
tree='CARTCV',cvType="folds")




