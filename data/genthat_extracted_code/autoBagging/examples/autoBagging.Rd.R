library(autoBagging)


### Name: autoBagging
### Title: autoBagging
### Aliases: autoBagging autoBagging autoBagging-package

### ** Examples

## Not run: 
##D # splitting an example dataset into train/test:
##D train <- iris[1:(.7*nrow(iris)), ]
##D test <- iris[-c(1:(.7*nrow(iris))), ]
##D # then apply autoBagging to the train, using the desired formula:
##D # autoBagging will compute metafeatures on the dataset
##D # and apply a pre-trained ranking model to recommend a workflow.
##D model <- autoBagging(Species ~., train)
##D # predictions are produced with the standard predict method
##D preds <- predict(model, test)
## End(Not run)



