# LIBS
library(treeman)
library(testthat)

# RUNNING
context('Testing \'update-methods\'')
test_that('pstMnp() works', {
  tree <- randTree(100, wndmtrx=sample(c(TRUE, FALSE), 1))
  tree@prinds <- NA
  tree <- pstMnp(tree)
  expect_true(!is.na(tree@prinds[1]))
})
test_that('addNdmtrx() works', {
  tree <- randTree(100, wndmtrx = FALSE)
  expect_true(is.null(tree@ndmtrx))
  tree <- addNdmtrx(tree)
  expect_false(is.null(tree@ndmtrx))
})
test_that('rmNdmtrx() works', {
  tree <- randTree(100, wndmtrx = TRUE)
  expect_false(is.null(tree@ndmtrx))
  tree <- rmNdmtrx(tree)
  expect_true(is.null(tree@ndmtrx))
})
test_that('updateSlts() works', {
  tree <- randTree(100, wndmtrx=sample(c(TRUE, FALSE), 1))
  tree@ndlst[['t1']][['spn']] <- NULL
  expect_error(updateTree(tree))
  tree@ndlst[['t1']][['spn']] <- 1000
  tree <- updateSlts(tree)
  expect_that(tree['pd'], is_more_than(1000))
})
