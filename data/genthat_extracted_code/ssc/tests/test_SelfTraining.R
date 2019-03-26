context("Testing SelfTraining")

source("wine.R")
require(caret)

test_that(
  desc = "selfTraining works",
  code = {
    m <- selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3)
    expect_is(m, "selfTraining")
    
    p <- predict(m, wine$xitest)
    expect_is(p, "factor")
    expect_equal(length(p), length(wine$ytrain))
    
    m <- selfTraining(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE,
                      learner = oneNN)
    expect_is(m, "selfTraining")
    
    p <- predict(m, wine$ditest[, m$instances.index])
    expect_is(p, "factor")
    expect_equal(length(p), length(wine$ytrain))
  }
)

test_that(
  desc = "prediction not fail when x is a vector",
  code = {
    m <- selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3)
    p <- predict(m, wine$xitest[1,])
    expect_is(p, "factor")
    expect_equal(length(p), 1)
  }
)

test_that(
  desc = "the model structure is correct",
  code = {
    m <- selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3)
    expect_equal(
      names(m), 
      c("model", "instances.index", "classes", "pred", "pred.pars")
    )
  }
)

test_that(
  desc = "x can be a data.frame",
  code = {
    x = as.data.frame(wine$xtrain)
    expect_is(selfTraining(x, y = wine$ytrain, learner = knn3),
              "selfTraining")
  }
)

test_that(
  desc = "y can be a vector",
  code = {
    y = as.vector(wine$ytrain)
    expect_is(selfTraining(x = wine$xtrain, y, learner = knn3),
              "selfTraining")
  }
)

test_that(
  desc = "x.inst can be coerced to logical",
  code = {
    expect_is(
      selfTraining(x.inst = TRUE, x = wine$xtrain, y = wine$ytrain, learner = knn3),
      "selfTraining"
    )
    expect_is(
      selfTraining(x.inst = 1, x = wine$xtrain, y = wine$ytrain, learner = knn3),
      "selfTraining"
    )
    expect_error(
      selfTraining(x.inst = "t", x = wine$xtrain, y = wine$ytrain, learner = knn3)
    )
  }
)

test_that(
  desc = "relation between x and y is correct",
  code = {
    expect_error(selfTraining(x = wine$xtrain, y = wine$ytrain[-1], learner = knn3))
    expect_error(selfTraining(x = wine$xtrain[-1,], y = wine$ytrain, learner = knn3))
  }
)

test_that(
  desc = "y has some labeled instances",
  code = {
    expect_error(
      selfTraining(x = wine$xtrain, y = rep(NA, length(wine$ytrain)), learner = knn3)
    )
  }
)

test_that(
  desc = "y has some unlabeled instances",
  code = {
    expect_error(
      selfTraining(x = wine$xtrain, y = rep(1, length(wine$ytrain)), learner = knn3)
    )
  }
)

test_that(
  desc = "x is a square matrix when x.inst is FALSE",
  code = {
    expect_error(
      selfTraining(x = wine$dtrain[-1,], y = wine$ytrain, x.inst = FALSE, learner = knn3)
    )
    expect_is(
      selfTraining(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE, learner = knn3),
      "selfTraining"
    )
  }
)

test_that(
  desc = "max.iter is a value greather than 0",
  code = {
    expect_error(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, max.iter = -1)
    )
    expect_error(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, max.iter = 0)
    )
    expect_is(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, max.iter = 80),
      "selfTraining"
    )
  }
)

test_that(
  desc = "perc.full is a value between 0 and 1",
  code = {
    expect_error(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, perc.full = -0.5)
    )
    expect_error(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, perc.full = 1.5)
    )
    expect_is(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, perc.full = 0.8),
      "selfTraining"
    )
  }
)

test_that(
  desc = "thr.conf is a value between 0 and 1",
  code = {
    expect_error(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, thr.conf = -0.5)
    )
    expect_error(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, thr.conf = 1.5)
    )
    expect_is(
      selfTraining(x = wine$xtrain, y = wine$ytrain, learner = knn3, thr.conf = 0.8),
      "selfTraining"
    )
  }
)