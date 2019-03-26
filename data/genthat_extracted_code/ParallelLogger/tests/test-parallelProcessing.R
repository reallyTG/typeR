library("testthat")

test_that("Computation across 3 threads", {
  fun <- function(x) {
    return(x^2)
  }
  
  cluster <- makeCluster(numberOfThreads = 3)
  x <- clusterApply(cluster, 1:10, fun)
  stopCluster(cluster)
  
  expect_equal(length(x), 10)
  expect_equal(sum(unlist(x)), sum((1:10)^2))
})
