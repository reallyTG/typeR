library(utiml)


### Name: mlpredict
### Title: Prediction transformation problems
### Aliases: mlpredict

### ** Examples


# Create a method that predict always the first class
# The model must be of the class 'fooModel'
mlpredict.fooModel <- function (model, newdata, ...) {
   # Predict the first class with a random confidence
   data.frame(
     prediction = rep(model$classes[1], nrow(newdata)),
     probability = sapply(runif(nrow(newdata)), function (score) {
       max(score, 1 - score)
     }),
     row.names = rownames(newdata)
   )
}

## Not run: 
##D # Create a SVM predict method using the e1071 package (the class of SVM model
##D # from e1071 package is 'svm')
##D library(e1071)
##D mlpredict.svm <- function (dataset, newdata, ...) {
##D    result <- predict(model, newdata, probability = TRUE, ...)
##D    attr(result, 'probabilities')
##D }
## End(Not run)



