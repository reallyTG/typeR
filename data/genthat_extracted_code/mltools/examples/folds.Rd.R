library(mltools)


### Name: folds
### Title: Cross Validation Folds
### Aliases: folds

### ** Examples

library(data.table)
folds(8, nfolds=2)
folds(alien.train$IsAlien, nfolds=2)
folds(alien.train$IsAlien, nfolds=2, stratified=TRUE, seed=2016)
folds(alien.train$IQScore, nfolds=2, stratified=TRUE, seed=2016)
folds(alien.train, nfolds=2, stratified="IsAlien", seed=2016)




