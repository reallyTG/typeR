# LIBS
library(treeman)
library(testthat)

# RUNNING
context('Testing \'display-methods\'')
test_that('as.character() works', {
  res <- as.character(randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1)))
  expect_that(class(res)[[1]], equals('character'))
})
test_that('show() works', {
  (randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1)))
})
test_that('str() works', {
  str(randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1)))
})
test_that('print() works', {
  print(randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1)))
})
test_that('summary() works', {
  summary(randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1)))
})