context("Testing TriTraining")

source("wine.R")
require(caret)

test_that(
  desc = "triTraining works",
  code = {
    m <- triTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3)
    expect_is(m, "triTraining")
    
    p <- predict(m, wine$xitest)
    expect_is(p, "factor")
    expect_equal(length(p), length(wine$ytrain))
    
    m <- triTraining(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE, learner = knn3)
    expect_is(m, "triTraining")
    
    p <- predict(m, wine$ditest[, m$instances.index])
    expect_is(p, "factor")
    expect_equal(length(p), length(wine$ytrain))
  }
)

test_that(
  desc = "prediction not fail when x is a vector",
  code = {
    m <- triTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3)
    p <- predict(m, wine$xitest[1,])
    expect_is(p, "factor")
    expect_equal(length(p), 1)
  }
)

test_that(
  desc = "the model structure is correct",
  code = {
    m <- triTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3)
    expect_equal(
      names(m), 
      c("model", "model.index", "instances.index", "model.index.map", 
        "classes", "pred", "pred.pars", "x.inst")
    )
  }
)

test_that(
  desc = "x can be a data.frame",
  code = {
    expect_is(
      triTraining(x = as.data.frame(wine$xtrain), y = wine$ytrain, learner = knn3),
      "triTraining"
    )
  }
)

test_that(
  desc = "y can be a vector",
  code = {
    expect_is(
      triTraining(x = wine$xtrain, y = as.vector(wine$ytrain), learner = knn3),
      "triTraining"
    )
  }
)

test_that(
  desc = "x.inst can be coerced to logical",
  code = {
    expect_is(
      triTraining(x = wine$xtrain, y = wine$ytrain, x.inst = TRUE, learner = knn3),
      "triTraining"
    )
    expect_is(
      triTraining(x = wine$xtrain, y = wine$ytrain, x.inst = 1, learner = knn3),
      "triTraining"
    )
    expect_error(
      triTraining(x = wine$xtrain, y = wine$ytrain, x.inst = "a", learner = knn3)
    )
  }
)

test_that(
  desc = "relation between x and y is correct",
  code = {
    expect_error(
      triTraining(x = wine$xtrain, y = wine$ytrain[-1], learner = knn3)
    )
    expect_error(
      triTraining(x = wine$xtrain[-1,], y = wine$ytrain, learner = knn3)
    )
  }
)

test_that(
  desc = "y has some labeled instances",
  code = {
    expect_error(
      triTraining(x = wine$xtrain, y = rep(NA, length(wine$ytrain)), learner = knn3)
    )
  }
)

test_that(
  desc = "y has some unlabeled instances",
  code = {
    expect_error(
      triTraining(x = wine$xtrain, y = rep(1, length(wine$ytrain)), learner = knn3)
    )
  }
)

test_that(
  desc = "x is a square matrix when x.inst is FALSE",
  code = {
    expect_error(
      triTraining(x = wine$dtrain[-1,], y = wine$ytrain, x.inst = FALSE, learner = knn3)
    )
    expect_is(
      triTraining(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE, learner = knn3),
      "triTraining"
    )
  }
)
