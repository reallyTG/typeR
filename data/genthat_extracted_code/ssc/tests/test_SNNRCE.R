context("Testing SNNRCE")

source("wine.R")

test_that(
  desc = "snnrce works",
  code = {
    m <- snnrce(x = wine$xtrain, y = wine$ytrain)
    expect_is(m, "snnrce")
    
    p <- predict(m, wine$xitest)
    expect_is(p, "factor")
    expect_equal(length(p), length(wine$ytrain))
    
    m <- snnrce(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE)
    expect_is(m, "snnrce")
    
    p <- predict(m, wine$ditest[, m$instances.index])
    expect_is(p, "factor")
    expect_equal(length(p), length(wine$ytrain))
  }
)

test_that(
  desc = "prediction not fail when x is a vector",
  code = {
    m <- snnrce(x = wine$xtrain, y = wine$ytrain)
    p <- predict(m, wine$xitest[1,])
    expect_is(p, "factor")
    expect_equal(length(p), 1)
  }
)

test_that(
  desc = "the model structure is correct",
  code = {
    m <- snnrce(x = wine$xtrain, y = wine$ytrain)
    expect_equal(
      names(m), 
      c("model", "instances.index", "classes", "x.inst", "dist", "xtrain")
    )
    
    m2 <- snnrce(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE)
    expect_equal(
      names(m2), 
      c("model", "instances.index", "classes", "x.inst")
    )
  }
)

test_that(
  desc = "x can be a data.frame",
  code = {
    expect_is(
      snnrce(x = as.data.frame(wine$xtrain), y = wine$ytrain),
      "snnrce"
    )
  }
)

test_that(
  desc = "y can be a vector",
  code = {
    expect_is(
      snnrce(x = wine$xtrain, y = as.vector(wine$ytrain)),
      "snnrce"
    )
  }
)

test_that(
  desc = "x.inst can be coerced to logical",
  code = {
    expect_is(
      snnrce(x = wine$xtrain, y = wine$ytrain, x.inst = TRUE),
      "snnrce"
    )
    expect_is(
      snnrce(x = wine$xtrain, y = wine$ytrain, x.inst = 1),
      "snnrce"
    )
    expect_error(
      snnrce(x = wine$xtrain, y = wine$ytrain, x.inst = "a")
    )
  }
)

test_that(
  desc = "relation between x and y is correct",
  code = {
    expect_error(
      snnrce(x = wine$xtrain, y = wine$ytrain[-1])
    )
    expect_error(
      snnrce(x = wine$xtrain[-1,], y = wine$ytrain)
    )
  }
)

test_that(
  desc = "y has some labeled instances",
  code = {
    expect_error(
      snnrce(x = wine$xtrain, y = rep(NA, length(wine$ytrain)))
    )
  }
)

test_that(
  desc = "y has some unlabeled instances",
  code = {
    expect_error(
      snnrce(x = wine$xtrain, y = rep(1, length(wine$ytrain)))
    )
  }
)

test_that(
  desc = "x is a square matrix when x.inst is FALSE",
  code = {
    expect_error(
      snnrce(x = wine$dtrain[-1,], y = wine$ytrain, x.inst = FALSE)
    )
    expect_is(
      snnrce(x = wine$dtrain, y = wine$ytrain, x.inst = FALSE),
      "snnrce"
    )
  }
)

test_that(
  desc = "alpha is a value between 0 and 1",
  code = {
    expect_error(
      snnrce(x = wine$xtrain, y = wine$ytrain, alpha = -0.5)
    )
    expect_error(
      snnrce(x = wine$xtrain, y = wine$ytrain, alpha = 1.5)
    )
    expect_is(
      snnrce(x = wine$dtrain, y = wine$ytrain, alpha = 0.15),
      "snnrce"
    )
  }
)