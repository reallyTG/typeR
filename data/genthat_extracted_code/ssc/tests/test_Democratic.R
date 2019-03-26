context("Testing Democratic")

source("wine.R")
require(caret)

test_that(
  desc = "democratic works",
  code = {
    m <- democratic(x = wine$xtrain, y = wine$ytrain,
                    learners = list(knn3, knn3))
    expect_is(m, "democratic")
    
    p <- predict(m, wine$xitest)
    expect_is(p, "factor")
    expect_equal(length(p), length(wine$ytrain))
    
    m <- democratic(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE,
                    learners = list(knn3, knn3))
    expect_is(m, "democratic")
    
    p <- predict(m, wine$ditest[, m$instances.index])
    expect_is(p, "factor")
    expect_equal(length(p), length(wine$ytrain))
  }
)

test_that(
  desc = "the learners are more than one",
  code = {
    expect_error(
      democratic(x = wine$xtrain, y = wine$ytrain, learners = list(knn3))
    )
    expect_error(
      democratic(x = wine$xtrain, y = wine$ytrain, learners = list())
    )
  }
)

test_that(
  desc = "the learners information is complete",
  code = {
    expect_error(democratic(x = wine$xtrain, y = wine$ytrain,
                            learners = list(knn3, knn3, knn3),
                            preds = list("predict", "predict")))
    expect_error(democratic(x = wine$xtrain, y = wine$ytrain,
                            learners = list(knn3, knn3),
                            preds = list("predict", "predict", "predict")))
    expect_error(democratic(x = wine$xtrain, y = wine$ytrain,
                            learners = list(knn3, knn3),
                            learners.pars = list(NULL),
                            preds = list("predict", "predict")))
    expect_error(democratic(x = wine$xtrain, y = wine$ytrain,
                            learners = list(knn3, knn3),
                            preds = list("predict", "predict"),
                            preds.pars = list(NULL)))
    expect_is(democratic(x = wine$xtrain, y = wine$ytrain,
                         learners = list(knn3, knn3)),
              class = "democratic")
  }
)

test_that(
  desc = "prediction not fail when x is a vector",
  code = {
    m <- democratic(x = wine$xtrain, y = wine$ytrain,
                    learners = list(knn3, knn3))
    p <- predict(m, wine$xitest[1,])
    expect_is(p, "factor")
    expect_equal(length(p), 1)
  }
)

test_that(
  desc = "the model structure is correct",
  code = {
    m <- democratic(x = wine$xtrain, y = wine$ytrain,
                    learners = list(knn3, knn3))
    expect_equal(
      names(m), 
      c("W", "model", "model.index", "instances.index", "model.index.map",
        "classes", "preds", "preds.pars", "x.inst")
    )
  }
)

test_that(
  desc = "x can be a data.frame",
  code = {
    expect_is(
      democratic(x = as.data.frame(wine$xtrain), y = wine$ytrain,
                 learners = list(knn3, knn3)),
      "democratic"
    )
  }
)

test_that(
  desc = "y can be a vector",
  code = {
    expect_is(
      democratic(x = wine$xtrain, y = as.vector(wine$ytrain),
                 learners = list(knn3, knn3)),
      "democratic"
    )
  }
)

test_that(
  desc = "x.inst can be coerced to logical",
  code = {
    expect_is(
      democratic(x = wine$xtrain, y = wine$ytrain, x.inst = TRUE,
                 learners = list(knn3, knn3)),
      "democratic"
    )
    expect_is(
      democratic(x = wine$xtrain, y = wine$ytrain, x.inst = 1,
                 learners = list(knn3, knn3)),
      "democratic"
    )
    expect_error(
      democratic(x = wine$xtrain, y = wine$ytrain, x.inst = "a",
                 learners = list(knn3, knn3))
    )
  }
)

test_that(
  desc = "relation between x and y is correct",
  code = {
    expect_error(democratic(x = wine$xtrain, y = wine$ytrain[-1],
                            learners = list(knn3, knn3)))
    expect_error(democratic(x = wine$xtrain[-1,], y = wine$ytrain,
                            learners = list(knn3, knn3)))
  }
)

test_that(
  desc = "y has some labeled instances",
  code = {
    expect_error(
      democratic(x = wine$xtrain, y = rep(NA, length(wine$ytrain)),
                 learners = list(knn3, knn3))
    )
  }
)

test_that(
  desc = "y has some unlabeled instances",
  code = {
    expect_error(
      democratic(x = wine$xtrain, y = rep(1, length(wine$ytrain)),
                 learners = list(knn3, knn3))
    )
  }
)

test_that(
  desc = "x is a square matrix when x.inst is FALSE",
  code = {
    expect_error(
      democratic(x = wine$dtrain[-1,], y = wine$ytrain, x.inst = FALSE,
                 learners = list(knn3, knn3))
    )
    expect_is(
      democratic(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE,
                 learners = list(knn3, knn3)),
      "democratic"
    )
  }
)
