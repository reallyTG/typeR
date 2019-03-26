library(superml)


### Name: NBTrainer
### Title: Naive Bayes Trainer
### Aliases: NBTrainer
### Keywords: datasets

### ** Examples

data(iris)
nb <- NBTrainer$new()
nb$fit(iris, 'Species')
y <- nb$predict(iris)



