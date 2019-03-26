context("tkmeans package testing suite")

test_that("Basic functionality not compromised", {
  set.seed(123)
  iris_mat <- as.matrix(iris[,1:4])
  expect_equal_to_reference(tkmeans(iris_mat, 2 , 0.1, c(1,1,1,1), 1, 10, 0.001), "test_one.rds")
  expect_equal_to_reference(tkmeans(iris_mat, 3 , 0.2, c(1,1,1,1),1, 10, 0.001), "test_two.rds")
  expect_equal_to_reference(tkmeans(iris_mat, 1 , 0.1, c(1,1,1,1),1, 10, 0.001), "test_three.rds")
  expect_equal_to_reference(tkmeans(iris_mat, 2 , 0.1), "test_four.rds")
})

test_that("Multistart", {
  set.seed(123)
  iris_mat <- as.matrix(iris[,1:4])
  expect_equal_to_reference(tkmeans(iris_mat, 2 , 0.1,c(1,1,1,1), 5, 10, 0.001), "test_multi_one.rds")
})

test_that("Scaling function", {
  m = matrix(rnorm(24, 1, 2),4, 6)
  m_orig=m*1.0
  scale_params = scale_mat_inplace(m)
  m_restore=sweep(sweep(m,2,scale_params[2,],'*'),2,scale_params [1,], '+')
  expect_equal(m_restore,m_orig)
})

test_that("BIC function", {
  set.seed(123)
  iris_mat <- as.matrix(iris[,1:4])
  expect_equal_to_reference(cluster_BIC(iris_mat,tkmeans(iris_mat, 2 , 0.1,c(1,1,1,1), 1, 10, 0.001)), "test_BIC_one.rds")
})

test_that("Cluster allocation function", {
  set.seed(123)
  iris_mat <- as.matrix(iris[,1:4])
  centres<- tkmeans(iris_mat, 4 , 0.1, c(1,1,1,1), 1, 10, 0.001)
  nearest_cluster(iris_mat, centres)
  expect_equal_to_reference(nearest_cluster(iris_mat, centres), "test_clust_one.rds")
})
