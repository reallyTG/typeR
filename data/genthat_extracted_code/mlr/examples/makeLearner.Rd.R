library(mlr)


### Name: makeLearner
### Title: Create learner object.
### Aliases: makeLearner Learner

### ** Examples

makeLearner("classif.rpart")
makeLearner("classif.lda", predict.type = "prob")
lrn = makeLearner("classif.lda", method = "t", nu = 10)
print(lrn$par.vals)



