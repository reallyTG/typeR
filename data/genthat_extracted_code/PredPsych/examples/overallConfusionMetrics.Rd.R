library(PredPsych)


### Name: overallConfusionMetrics
### Title: Confusion Matrix metrics for Cross-validation
### Aliases: overallConfusionMetrics

### ** Examples

# Result from a confusion matrix 
confusionMat <- list(table = matrix(c(110,29,80,531),ncol = 2,
dimnames = list(Prediction = c(1,2),Reference = c(1,2))))
overallConfusionMetrics(confusionMat)

# Output:
#
# Confusion Matrix and Statistics
#           Reference
# Predicted   1   2
#          1 110  80
#          2  29 531
# Accuracy : 0.8547          
# 95% CI : (0.8274, 0.8791)
# No Information Rate : 0.8147          
# P-Value [Acc > NIR] : 0.002214        
# 
# Kappa : 0.5785          
# Mcnemar's Test P-Value : 1.675e-06       
# 
# Sensitivity : 0.7914          
# Specificity : 0.8691          
# Pos Pred Value : 0.5789          
# Neg Pred Value : 0.9482          
# Prevalence : 0.1853          
# Detection Rate : 0.1467          
# Detection Prevalence : 0.2533          
# Balanced Accuracy : 0.8302          
# 
# 'Positive' Class : 1         

# Alternative (realistic) examples
Results <- classifyFun(Data = KinData,classCol = 1,
selectedCols = c(1,2,12,22,32,42,52,62,72,82,92,102,112),cvType = "folds",
extendedResults = TRUE)

overallConfusionMetrics(Results$ConfMatrix)






