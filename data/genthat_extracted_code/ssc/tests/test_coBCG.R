context("Testing Generic CoBC")

source("wine.R")
library(caret)

test_that(
  desc = "coBCCombine works when only one instance is predicted",
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
    m1 <- coBCG(y = wine$ytrain, gen.learner = knn, gen.pred = knn.prob)
    ### Predict
    e <- matrix(wine$xitest[1,], nrow = 1)
    h.prob <- lapply(m1$model, function(m) predict(m, e))
    # Combine the predictions
    cls1 <- coBCCombine(h.prob, m1$classes)
    expect_is(cls1, "factor")
  }
)