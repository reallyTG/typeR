library(stablelearner)


### Name: addLearner
### Title: Add Learners to 'LearnerList'
### Aliases: addLearner
### Keywords: stability, similarity, resampling

### ** Examples


newlearner <- list(
  class   = "svm",
  package = "e1071",
  method  = "Support Vector Machine",
  predict = function(x, newdata, yclass = NULL) {
    if(match(yclass, c("ordered", "factor"))) {
      attr(predict(x, newdata = newdata, probability = TRUE), "probabilities")
    } else {
      predict(x, newdata = newdata)
    }
  })

addLearner(newlearner)




