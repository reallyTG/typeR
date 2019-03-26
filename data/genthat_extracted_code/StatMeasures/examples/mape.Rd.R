library(StatMeasures)


### Name: mape
### Title: Compute mean absolute percentage error
### Aliases: mape

### ** Examples

# A 'data.frame' with y and yhat
 df <- data.frame(y = c(1.5, 2, 3.2),
                  yhat = c(3.4, 2.2, 2.7))

# Compute mape
MAPE <- mape(y = df[, 'y'], yhat = df[, 'yhat'])



