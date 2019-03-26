context("Testing Generic TriTraining")

source("wine.R")
library(caret)

test_that(
  desc = "triTrainingCombine works when only one instance is predicted",
  code = {
    ### Define knn base classifier using knn3 from caret package
    # learner function
    knn <- function(indexes, cls) {
      knn3(x = wine$xtrain[indexes, ], y = cls, k = 1)
    }
    # function to predict probabilities
    knn.prob <- function(model, indexes) {
      predict(model, wine$xtrain[indexes, ])
    }
    
    ### Train
    m1 <- triTrainingG(y = wine$ytrain, gen.learner = knn, gen.pred = knn.prob)
    ### Predict
    e <- matrix(wine$xitest[1,], nrow = 1)
    pred <- lapply(m1$model, function(m) predict(m, e, type = "class"))
    # Combine the predictions
    cls1 <- triTrainingCombine(pred)
    expect_is(cls1, "factor")
  }
)