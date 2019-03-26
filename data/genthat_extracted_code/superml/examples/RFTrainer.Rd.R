library(superml)


### Name: RFTrainer
### Title: Random Forest Trainer
### Aliases: RFTrainer
### Keywords: datasets

### ** Examples

data("iris")
bst <- RFTrainer$new(n_estimators=50,
                     max_depth=4,
                     classification=1,
                     seed=42,
                     verbose=TRUE)
bst$fit(iris, 'Species')
predictions <- bst$predict(iris)
bst$get_importance()



