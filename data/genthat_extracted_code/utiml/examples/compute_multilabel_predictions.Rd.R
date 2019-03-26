library(utiml)


### Name: compute_multilabel_predictions
### Title: Compute the multi-label ensemble predictions based on some vote
###   schema
### Aliases: compute_multilabel_predictions

### ** Examples

## Not run: 
##D model <- br(toyml, "KNN")
##D predictions <- list(
##D  predict(model, toyml[1:10], k=1),
##D  predict(model, toyml[1:10], k=3),
##D  predict(model, toyml[1:10], k=5)
##D )
##D 
##D result <- compute_multilabel_predictions(predictions, "maj")
##D 
##D ## Random choice
##D random_choice <- function (bipartition, probability) {
##D  cols <- sample(seq(ncol(bipartition)), nrow(bipartition), replace = TRUE)
##D  list(
##D    bipartition = bipartition[cbind(seq(nrow(bipartition)), cols)],
##D    probability = probability[cbind(seq(nrow(probability)), cols)]
##D  )
##D }
##D result <- compute_multilabel_predictions(predictions, "random_choice")
## End(Not run)



