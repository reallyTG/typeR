# LIBS
library(treeman)
library(testthat)

# RUNNING
context('Testing \'gen-methods\'')
test_that('randTree() works', {
  ns <- sample(3:100, 5)
  for(n in ns) {
    tree <- randTree(n, wndmtrx=sample(c(TRUE, FALSE), 1))
    expect_that(tree['ntips'], equals(n))
    tree_age <- getAge(tree)
    expect_that(tree['pd'], is_more_than(tree_age))
  }
})
test_that('blncdTree() works', {
  ns <- sample(3:100, 5)
  for(n in ns) {
    tree <- blncdTree(n, wndmtrx=sample(c(TRUE, FALSE), 1))
    expect_that(tree['ntips'], equals(n))
    tree_age <- getAge(tree)
    expect_that(tree['pd'], is_more_than(tree_age))
  }
})
test_that('unblncdTree() works', {
  ns <- sample(3:100, 5)
  for(n in ns) {
    tree <- unblncdTree(n, wndmtrx=sample(c(TRUE, FALSE), 1))
    expect_that(tree['ntips'], equals(n))
    tree_age <- getAge(tree)
    expect_that(tree['pd'], is_more_than(tree_age))
  }
})
test_that('twoer() works', {
  tree <- twoer()
  expect_equal(tree['ntips'], 2)
})