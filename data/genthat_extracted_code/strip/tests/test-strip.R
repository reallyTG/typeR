context("Strip")

test_that("predict.lm works correctly after stripping", {
  set.seed(111)
  mtcars <- datasets::mtcars
  i <- sample(2, nrow(mtcars), replace = TRUE, prob = c(0.8, 0.2))
  r1 <- stats::lm(mpg ~ ., data = mtcars[i == 1,])
  r2 <- strip(r1, keep = "predict")
  p1 <- stats::predict(r1, newdata = mtcars[i == 2,])
  p2 <- try(stats::predict(r2, newdata = mtcars[i == 2,]), silent = TRUE)
  
  expect_false(inherits(p2, "try-error"))
  expect_identical(p1, p2)
})

test_that("print.lm works correctly after stripping", {
  mtcars <- datasets::mtcars
  r1 <- stats::lm(mpg ~ ., data = mtcars)
  r2 <- strip(r1, keep = "print")
  q1 <- print(r1)
  q2 <- try(print(r2), silent = TRUE)
  
  expect_false(inherits(q2, "try-error"))
  expect_identical(utils::capture.output(q1), utils::capture.output(q2))
})

test_that("predict.glm works correctly after stripping", {
  ldose <- rep(0:5, 2)
  numdead <- c(1, 4, 9, 13, 18, 20, 0, 2, 6, 10, 12, 16)
  sex <- factor(rep(c("M", "F"), c(6, 6)))
  SF <- cbind(numdead, numalive = 20-numdead)
  ld <- seq(0, 5, 0.1)
  r1 <- stats::glm(SF ~ sex*ldose, family = binomial)
  r2 <- strip(r1, keep = "predict")
  df <- data.frame(ldose = ld,
                  sex = factor(rep("M", length(ld)), levels = levels(sex)))
  p1 <- stats::predict(r1, newdata = df, type = "response")
  p2 <- try(stats::predict(r2, newdata = df, type = "response"), silent = TRUE)
  
  expect_false(inherits(p2, "try-error"))
  expect_identical(p1, p2)
})

test_that("print.glm works correctly after stripping", {
  ldose <- rep(0:5, 2)
  numdead <- c(1, 4, 9, 13, 18, 20, 0, 2, 6, 10, 12, 16)
  sex <- factor(rep(c("M", "F"), c(6, 6)))
  SF <- cbind(numdead, numalive = 20-numdead)
  r1 <- stats::glm(SF ~ sex*ldose, family = binomial)
  r2 <- strip(r1, keep = "print")
  q1 <- print(r1)
  q2 <- try(print(r2), silent = TRUE)
  
  expect_false(inherits(q2, "try-error"))
  expect_identical(utils::capture.output(q1), utils::capture.output(q2))
})

test_that("predict.loess works correctly after stripping", {
  cars <- datasets::cars
  set.seed(211)
  i <- sample(2, nrow(cars), replace = TRUE, prob = c(0.8, 0.2))
  r1 <- stats::loess(dist ~ speed, cars[i == 1,])
  r2 <- strip(r1, keep = "predict")
  p1 <- stats::predict(r1, newdata = cars[i == 2,])
  p2 <- try(stats::predict(r2, newdata = cars[i == 2,]), silent = TRUE)
  
  expect_false(inherits(p2, "try-error"))
  expect_identical(p1, p2)
})

test_that("print.loess works correctly after stripping", {
  cars <- datasets::cars
  r1 <- stats::loess(dist ~ speed, cars)
  r2 <- strip(r1, keep = "print")
  q1 <- print(r1)
  q2 <- try(print(r2), silent = TRUE)
  
  expect_false(inherits(q2, "try-error"))
  expect_identical(utils::capture.output(q1), utils::capture.output(q2))
})

test_that("predict.randomForest works correctly after stripping", {
  iris <- datasets::iris
  set.seed(311)
  i <- sample(2, nrow(iris), replace = TRUE, prob = c(0.8, 0.2))
  r1 <- randomForest::randomForest(Species ~ ., data = iris[i == 1,])
  r2 <- strip(r1, keep = "predict")
  p1 <- stats::predict(r1, newdata = iris[i == 2,])
  p2 <- try(stats::predict(r2, newdata = iris[i == 2,]), silent = TRUE)
  
  expect_false(inherits(p2, "try-error"))
  expect_identical(p1, p2)
})

test_that("print.randomForest works correctly after stripping", {
  iris <- datasets::iris
  r1 <- randomForest::randomForest(Species ~ ., data = iris)
  r2 <- strip(r1, keep = "print")
  q1 <- print(r1)
  q2 <- try(print(r2), silent = TRUE)
  
  expect_false(inherits(q2, "try-error"))
  expect_identical(utils::capture.output(q1), utils::capture.output(q2))
})

test_that("predict.train works correctly after stripping", {
  iris <- datasets::iris
  set.seed(311)
  i <- sample(2, nrow(iris), replace = TRUE, prob = c(0.8, 0.2))
  r1 <- caret::train(Species ~ ., data = iris[i == 1,], method = "rf")
  r2 <- strip(r1, keep = "predict")
  p1 <- stats::predict(r1, newdata = iris[i == 2,])
  p2 <- try(stats::predict(r2, newdata = iris[i == 2,]), silent = TRUE)
  
  expect_false(inherits(p2, "try-error"))
  expect_identical(p1, p2)
})

test_that("print.train works correctly after stripping", {
  iris <- datasets::iris
  r1 <- caret::train(Species ~ ., data = iris, method = "rf")
  r2 <- strip(r1, keep = "print")
  q1 <- print(r1)
  q2 <- try(print(r2), silent = TRUE)
  
  expect_false(inherits(q2, "try-error"))
  expect_identical(utils::capture.output(q1), utils::capture.output(q2))
})
