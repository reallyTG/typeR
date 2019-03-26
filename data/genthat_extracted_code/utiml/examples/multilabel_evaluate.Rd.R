library(utiml)


### Name: multilabel_evaluate
### Title: Evaluate multi-label predictions
### Aliases: multilabel_evaluate multilabel_evaluate.mldr
###   multilabel_evaluate.mlconfmat

### ** Examples

## Not run: 
##D prediction <- predict(br(toyml), toyml)
##D 
##D # Compute all measures
##D multilabel_evaluate(toyml, prediction)
##D multilabel_evaluate(toyml, prediction, labels=TRUE) # Return a list
##D 
##D # Compute bipartition measures
##D multilabel_evaluate(toyml, prediction, "bipartition")
##D 
##D # Compute multilples measures
##D multilabel_evaluate(toyml, prediction, c("accuracy", "F1", "macro-based"))
##D 
##D # Compute the confusion matrix before the measures
##D cm <- multilabel_confusion_matrix(toyml, prediction)
##D multilabel_evaluate(cm)
##D multilabel_evaluate(cm, "example-based")
##D multilabel_evaluate(cm, c("hamming-loss", "subset-accuracy", "F1"))
## End(Not run)



