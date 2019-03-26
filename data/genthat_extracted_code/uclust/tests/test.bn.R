

md=matrix(c(0,1,1,2,1,0,1,1,1,1,0,1,2,1,1,0),ncol=4)

test_that("Bn functions are symetric and match", {
  expect_equal(bn(c(1,0,0,0),md), Bn(c(1,3),md))
  expect_equal(bn(c(0,0,0,1),md), bn(c(1,1,1,0),md))
  expect_equal(bn(c(0,0,1,1),md), Bn(c(2,2),md))
  expect_equal(Bn(c(3,1),md), Bn(c(1,3),md[c(4,3,2,1),c(4,3,2,1)]))
})

