context("Nearest Neighbor Computation")

test_that("Neighbor Indices",{
  X       <- matrix(c(1:10,rep(1,10)),ncol=2)
  nn_bors <- nearest_neighbors(X,3)
  expect_equivalent(nn_bors$nn_inds[,1],1:10)
  expect_equivalent(nn_bors$nn_inds[,2],c(2,1:9))
  expect_equivalent(nn_bors$nn_inds[,3],c(3,3:10,8))
  expect_equivalent(nn_bors$nn_inds[,4],c(4,4,1:7,7))
}
)

test_that("Neighbor Distances",{
  X       <- matrix(c(1:10),ncol=1)
  nn_bors <- nearest_neighbors(X,3)
  expect_equivalent(nn_bors$nn_dist[,1],rep(0,10))
  expect_equivalent(nn_bors$nn_dist[,2],rep(1,10))
  expect_equivalent(nn_bors$nn_dist[,3],c(2,rep(1,8),2))
  expect_equivalent(nn_bors$nn_dist[,4],c(3,rep(2,8),3))
}
)

test_that("Neighbor Dimensions",{
  X       <- matrix(runif(100),ncol=5)
  nn_bors <- nearest_neighbors(X,1)
  expect_equal(dim(nn_bors$nn_dist),c(20,2))
  expect_equal(dim(nn_bors$nn_dist),c(20,2))
  nn_bors <- nearest_neighbors(X,2)
  expect_equal(dim(nn_bors$nn_dist),c(20,3))
  expect_equal(dim(nn_bors$nn_dist),c(20,3))
  nn_bors <- nearest_neighbors(X,3)
  expect_equal(dim(nn_bors$nn_dist),c(20,4))
  expect_equal(dim(nn_bors$nn_dist),c(20,4))
}
)
