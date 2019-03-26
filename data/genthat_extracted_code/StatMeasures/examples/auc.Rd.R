library(StatMeasures)


### Name: auc
### Title: Area under curve of predicted binary response
### Aliases: auc

### ** Examples

# A 'data.frame' with y and yhat
df <- data.frame(y = c(1, 0, 1, 1, 0, 0, 1, 0, 1, 0),
                 yhat = c(0.86, 0.23, 0.65, 0.92, 0.37, 0.45, 0.72, 0.19, 0.92, 0.50))

# AUC figure
AUC <- auc(y = df[, 'y'], yhat = df[, 'yhat'])



