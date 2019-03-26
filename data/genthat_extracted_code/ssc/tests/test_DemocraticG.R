context("Testing Generic Democratic")

source("wine.R")
library(kernlab)
library(caret)

test_that(
  desc = "democraticCombine works when only one instance is predicted",
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
    svm <- function(indexes, cls){
      ksvm(x = wine$xtrain[indexes, ], y = cls, prob.model = TRUE)
    }
    svm.prob <- function(model, indexes) {
      kernlab::predict(model, wine$xtrain[indexes, ], type = "probabilities")
    }
    
    ### Train
    m1 <- democraticG(y = wine$ytrain, 
                      gen.learners = list(knn, svm),
                      gen.preds = list(knn.prob, svm.prob))
    ### Predict
    # predict labels using each classifier
    e <- matrix(wine$xitest[1,], nrow = 1)
    m1.pred1 <- predict(m1$model[[1]], e, type = "class")
    m1.pred2 <- kernlab::predict(m1$model[[2]], e)
    # combine predictions
    m1.pred <- list(m1.pred1, m1.pred2)
    cls1 <- democraticCombine(m1.pred, m1$W, m1$classes)
    expect_is(cls1, "factor")
  }
)