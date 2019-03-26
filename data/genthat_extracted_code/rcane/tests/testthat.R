library(testthat)
library(rcane)

context("input parameter check")

test_that("check for valid methods", {
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width, iris, method='bgd', alpha=0.01), NA)
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width, iris, method='sgd', alpha=0.01), NA)
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width, iris, method='mini-bgd', alpha=0.01), NA)
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width, iris, method='cd'), NA)
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width, iris, method='xxx', alpha=0.01))
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width, iris, method='', alpha=0.01))
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width, iris, method='bgdsgd', alpha=0.01))
})

context("input matrix check")

test_that("Check parameters in dataframe", {
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width, iris, method='bgd', alpha=0.01), NA)
  expect_error(rcane::rlm(Sepal.Length~Petal.Width, iris, method='bgd', alpha=0.01), NA)
  expect_error(rcane::rlm(Sepal.Length~Sepal.Width + Petal.Length, iris, method='bgd', alpha=0.01), NA)
  expect_error(rcane::rlm(Sepal.Length~., iris, method='bgd', alpha=0.01), NA)
  expect_error(rcane::rlm(xxx~Sepal.Width, iris, method='bgd', alpha=0.01))
  expect_error(rcane::rlm(Sepal.Length~xxx, iris, method='bgd', alpha=0.01))
  expect_error(rcane::rlm(Sepal.Length~5566, iris, method='bgd', alpha=0.01))
  expect_error(rcane::rlm(xxx~xxx, iris, method='bgd', alpha=0.01))
  expect_warning(rcane::rlm(Species~., iris, method='bgd', alpha=0.01))
})

f <- Sepal.Length ~ Sepal.Width
f[[1]] = `+`

test_that("Invalid formula", {
  expect_error(rcane::rlm(f, iris, method='bgd'))
})

df.test <- data.frame(x = numeric(), y=numeric())

test_that("empty row", {
  expect_error(rcane::rlm(x~y, df.test, method='bgd'))
})

df.test.2 <- data.frame(x = c(NA,NA,NA), y = c(NA,NA,NA))
df.test.3 <- data.frame(x = c(NA, 3, NA),y = c(3, 3, NA))

test_that("NA in data frame", {
  expect_error(rcane::rlm(x~y, df.test.2, method='bgd'))
  expect_error(rcane::rlm(x~y, df.test.3, method='bgd'), NA)
})

context("Regression")
  set.seed(123)
  
  x1 <- runif(10000, -2, 2)
  x2 <- runif(10000, -2, 2)
  e <- rnorm(10000, 0, 4)
  y <- 2*x1 + 5*x2 + 10 + e
  
  df.test4 = data.frame(x1, x2, y)

test_that("manual created dataframe", {
  expect_equal(coef(rcane::rlm(y~x1+x2, df.test4, method="bgd")), 
                coef(lm(y~x1+x2, df.test4)),
                tolerance = 0.005)
  expect_equal(coef(rcane::rlm(y~x1+x2, df.test4, method="mini-bgd")), 
               coef(lm(y~x1+x2, df.test4)),
               tolerance = 0.005)
  expect_equal(coef(rcane::rlm(y~x1+x2, df.test4, method="cd")), 
               coef(lm(y~x1+x2, df.test4)),
               tolerance = 0.005)
  expect_equal(coef(rcane::rlm(y~x1+x2, df.test4, method="sgd")), 
                    coef(lm(y~x1+x2, df.test4)),
                    tolerance = 0.005)
})

test_that("bold driver", {
  expect_equal(coef(rcane::rlm(y~x1+x2, df.test4, method="bgd", alpha=1000, boldDriver=TRUE)), 
               coef(lm(y~x1+x2, df.test4)),
               tolerance = 0.005)
})

test_that("adagrad", {
  expect_equal(coef(rcane::rlm(y~x1+x2, df.test4, method="sgd", alpha=1000000, max.iter=100, AdaGrad=TRUE)),
               coef(lm(y~x1+x2, df.test4)),
               tolerance = 0.1)
})

test_that("warnings for adagrad and bold driver", {
  expect_warning(rcane::rlm(y~x1+x2, df.test4, method="bgd", alpha=1000000, max.iter=100, AdaGrad=TRUE))
  expect_warning(rcane::rlm(y~x1+x2, df.test4, method="sgd", alpha=1000, boldDriver=TRUE))
})
