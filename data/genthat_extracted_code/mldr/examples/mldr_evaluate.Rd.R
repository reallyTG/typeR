library(mldr)


### Name: mldr_evaluate
### Title: Evaluate predictions made by a multilabel classifier
### Aliases: mldr_evaluate

### ** Examples

## Not run: 
##D library(mldr)
##D 
##D # Get the true labels in emotions
##D predictions <- as.matrix(emotions$dataset[, emotions$labels$index])
##D # and introduce some noise (alternatively get the predictions from some classifier)
##D noised_labels <- cbind(sample(1:593, 200, replace = TRUE), sample(1:6, 200, replace = TRUE))
##D predictions[noised_labels] <- sample(0:1, 100, replace = TRUE)
##D # then evaluate predictive performance
##D res <- mldr_evaluate(emotions, predictions)
##D str(res)
##D plot(res$roc, main = "ROC curve for emotions")
## End(Not run)



