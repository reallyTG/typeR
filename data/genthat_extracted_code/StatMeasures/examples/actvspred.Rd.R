library(StatMeasures)


### Name: actvspred
### Title: Comparison of actual and predicted linear response
### Aliases: actvspred

### ** Examples

# A 'data.frame' with y and yhat
df <- data.frame(y = c(1, 2, 3, 6, 8, 10, 15),
                 yhat = c(1.2, 2.5, 3.3, 6.9, 9.3, 6.5, 12.3))

# Get actual vs predicted table
ACTVSPRED <- actvspred(y = df[, 'y'], yhat = df[, 'yhat'], n = 5)



