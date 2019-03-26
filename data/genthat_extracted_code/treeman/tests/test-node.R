# LIBS
library(treeman)
library(testthat)

# RUNNING
context('Testing \'Node Class\'')
test_that('.newNd works', {
  nd <- treeman:::.newNd(randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1)),
                         'n1')
  expect_that(class(nd)[[1]], equals('Node'))
})
test_that('Node works (rooted + with spns)', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  nid <- tree['all'][sample(1:10, 1)]
  nd <- tree[[nid]]
})
test_that('Node works (rooted + w/o spns)', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  tree <- setNdsSpn(tree, ids=tree['all'], vals=0)
  nid <- tree['all'][sample(1:10, 1)]
  nd <- tree[[nid]]
})
test_that('Node works (unrooted  + w/o spns))', {
  tree <- randTree(10, wndmtrx=sample(c(TRUE, FALSE), 1))
  #TODO: remove branch lengths
  #TODO: remove root
  nid <- tree['all'][sample(1:10, 1)]
  nd <- tree[[nid]]
  summary(nd)
})