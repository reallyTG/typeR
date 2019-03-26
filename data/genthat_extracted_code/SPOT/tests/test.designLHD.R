
test_that("check dimensionality of returned LHD designs", {
  design <- designLHD(,1,2,control=list(size=10))
  expect_equal(dim(design), c(10,1))
  design <- designLHD(matrix(1:2,2,1),1,2,control=list(size=10))
  expect_equal(dim(design), c(12,1))
  design <- designLHD(,c(1,-1),c(2,10),control=list(size=10))
  expect_equal(dim(design), c(10,2))
})
test_that("check whether design is within bounds", {
  design <- designLHD(,1,2,control=list(size=10))
  expect_true(all(design>=matrix(1,10,1) & design<=matrix(2,10,1)), c(10,1))
  design <- designLHD(,c(1,-1),c(2,10),control=list(size=10))
  expect_true(all(design>=matrix(c(1,-1),10,2,byrow=T) & design<=matrix(c(2,10),10,2,byrow=T)), c(10,1))
})