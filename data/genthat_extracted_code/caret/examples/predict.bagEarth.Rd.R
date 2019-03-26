library(caret)


### Name: predict.bagEarth
### Title: Predicted values based on bagged Earth and FDA models
### Aliases: predict.bagEarth predict.bagFDA
### Keywords: regression

### ** Examples


## Not run: 
##D data(trees)
##D ## out of bag predictions vs just re-predicting the training set
##D set.seed(655)
##D fit1 <- bagEarth(Volume ~ ., data = trees, keepX = TRUE)
##D set.seed(655)
##D fit2 <- bagEarth(Volume ~ ., data = trees, keepX = FALSE)
##D hist(predict(fit1) - predict(fit2))
## End(Not run)




