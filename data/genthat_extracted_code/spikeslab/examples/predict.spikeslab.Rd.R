library(spikeslab)


### Name: predict.spikeslab
### Title: Spike and Slab Prediction
### Aliases: predict.spikeslab
### Keywords: regression

### ** Examples

## Not run: 
##D 
##D #------------------------------------------------------------
##D # Example 1: get the predictor for the training data
##D #------------------------------------------------------------
##D data(diabetesI, package = "spikeslab")
##D x <- diabetesI[, -1]
##D y <- diabetesI[, 1]
##D obj <- spikeslab(x = x, y = y)
##D #gnet predictor
##D yhat.gnet <- predict(obj)$yhat.gnet
##D #an equivalent call is...
##D yhat.gnet <- predict(obj, x = x)$yhat.gnet
##D 
##D #------------------------------------------------------------
##D # Example 2: ozone data with interactions
##D #------------------------------------------------------------
##D 
##D data(ozoneI, package = "spikeslab")
##D train.pt <- sample(1:nrow(ozoneI), nrow(ozoneI) * 0.80)
##D obj <- spikeslab(ozone ~ . , ozoneI[train.pt, ])
##D ytest <- ozoneI$ozone[-train.pt]
##D ss.pred <- predict(obj, ozoneI[-train.pt, ])
##D yhat.bma <- ss.pred$yhat.bma
##D yhat.gnet <- ss.pred$yhat.gnet
##D plot(ytest, yhat.bma, ylab = "yhat", pch = 16, col = 4)
##D points(ytest, yhat.gnet, pch = 16, col = 2)
##D abline(0, 1, lty = 2, col = 2)
##D legend("bottomright", legend = c("bma", "gnet"), col = c(4, 2), pch = 16)
## End(Not run)



