library(StatMeasures)


### Name: accuracy
### Title: Confusion matrix and overall accuracy of predicted binary
###   response
### Aliases: accuracy

### ** Examples

# A 'data.frame' with y and yhat
df <- data.frame(y = c(1, 0, 1, 1, 0),
                 yhat = c(0.86, 0.23, 0.65, 0.92, 0.37))

# Accuracy tables and overall accuracy figures
ltAccuracy <- accuracy(y = df[, 'y'], yhat = df[, 'yhat'], cutoff = 0.7)
accuracyNumber <- ltAccuracy$accuracyNum
accuracyPercentage <- ltAccuracy$accuracyPer
overallAccuracy <- ltAccuracy$overallAcc



