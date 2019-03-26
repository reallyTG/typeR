# LIBS
library(treeman)
library(testthat)

# RUNNING
context('Testing \'cnvrt-methods\'')
test_that('TreeMan-to-phylo works', {
  tree <- randTree(100, wndmtrx=sample(c(TRUE, FALSE), 1))
  tree <- as(tree, "phylo")
  expect_true("phylo" %in% class(tree))
})
test_that('phylo-to-TreeMan works', {
  tree <- ape::rtree(100)
  tree <- as(tree, "TreeMan")
  expect_equal(class(tree)[1], "TreeMan")
})
test_that('multiPhylo-to-TreeMen works', {
  trees <- c(ape::rtree(100), ape::rtree(100), ape::rtree(100))
  trees <- as(trees, "TreeMen")
  expect_equal(is(trees), "TreeMen")
})
test_that('TreeMen-to-multiPhylo works', {
  trees <- cTrees(randTree(100), randTree(100),
                  randTree(100, wndmtrx=sample(c(TRUE, FALSE), 1)))
  trees <- as(trees, "multiPhylo")
  expect_true("multiPhylo" %in% class(trees))
})