library(rEMM)


### Name: synthetic_stream
### Title: Create a Synthetic Data Stream
### Aliases: synthetic_stream
### Keywords: datagen

### ** Examples

## create only test data (with outliers)
ds <- synthetic_stream(n_train=0)

## plot test data
plot(ds$test, pch = ds$sequence_test, col ="gray")
text(ds$model$mu[,1], ds$model$mu[,2], 1:10)

## mark outliers
points(ds$test[ds$outlier_position,], pch=3, lwd=2, col="red")



