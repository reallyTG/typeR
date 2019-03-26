context("comparison measure functions")

test_that("distance matches expected output", {
  expect_equal(distance(c(1),c(1),"euclidean"),0)
  expect_equal(distance(c(-1,2.5,3),c(1,5,8.9),"euclidean"),6.71267457873)
  
  expect_equal(distance(c(1),c(1),"squared_euclidean"),0)
  expect_equal(distance(c(-1,2.5,3),c(1,5,8.9),"squared_euclidean"),45.0600)
})

test_that("similarity matches expected output", {
  expect_equal(similarity(c(1),c(1),"simple_matching"),1)
  expect_equal(similarity(c(0,0,1,1),c(0,1,0,0),"simple_matching"),0.25)
  
  expect_equal(similarity(c(1),c(1),"jaccard"),1)
  expect_equal(similarity(c(0,0,1,1),c(0,1,0,0),"jaccard"),0)
  
  expect_equal(similarity(c(1),c(1),"tanimoto"),1)
  expect_equal(similarity(c(0,0,1,1),c(0,1,0,0),"tanimoto"),0.142857142857)
})


test_that("comparison measure inputs are of same length", {
  expect_error(distance(c(1),c(1,2),"euclidean"),"input vectors must be of the same length")
  expect_error(distance(c(1,2),c(1,2,3),"squared_euclidean"),"input vectors must be of the same length")
  expect_error(similarity(c(1,0,0),c(1,0),"simple_matching"),"input vectors must be of the same length")
  expect_error(similarity(c(1),c(1,0),"jaccard"),"input vectors must be of the same length")
  expect_error(similarity(c(1,0,0),c(1,0),"euclidean"),"input vectors must be of the same length")
})

test_that("comparison measure inputs are not factors", {
  expect_error(distance(as.factor(c(0,2,0.4,1)),c(0,1,5,1),"euclidean"),"input vectors must not be factors")
  expect_error(distance(as.factor(c(0,2,0.4,1)),c(0,1,5,1),"squared_euclidean"),"input vectors must not be factors")
  expect_error(similarity(as.factor(c(0,1,0,1)),as.factor(c(0,1,1,1)),"simple_matching"),"input vectors must not be factors")
  expect_error(similarity(c(0,1,0),as.factor(c(0,1,1)),"jaccard"),"input vectors must not be factors")
  expect_error(similarity(as.factor(c(1,0,1)),c(1,1,1),"tanimoto"),"input vectors must not be factors")
})

test_that("similarity measure input elements consist of {0,1}", {
  expect_error(similarity(c(0,1,0),c(0,1,2),"simple_matching"),"all vectors must consist of {0,1}")
  expect_error(similarity(c(4.3,1),c(0,1),"jaccard"),"all vectors must consist of {0,1}")
  expect_error(similarity(c(0,1,0,-9.3),c(0,1,2,0.8),"tanimoto"),"all vectors must consist of {0,1}")
})
