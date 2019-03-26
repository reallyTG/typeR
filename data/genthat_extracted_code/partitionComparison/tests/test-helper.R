library(testthat)
library(partitionComparison)
context("Test helper functions")

test_that("setOverlap produces the correct results", {
  expect_equal(setOverlap(c(0, 0, 0, 0), c(1, 1, 1, 1), 0, 1), 4)
  expect_equal(setOverlap(c(0, 0, 0, 0), c(1, 1, 1, 1), 0, 0), 0)
  expect_equal(setOverlap(c(0, 0, 0, 0), c(0, 0, 1, 1), 0, 0), 2)
  expect_equal(setOverlap(c(0, 0, 0, 0), c(0, 0, 1, 1), 0, 1), 2)
})

test_that("projectionNumber produces the correct results", {
  expect_equal(projectionNumber(p, q), 4)
  expect_equal(projectionNumber(q, p), 4)
  expect_equal(projectionNumber(p, r), 4)
  expect_equal(projectionNumber(r, p), 3)
  expect_equal(projectionNumber(p, s), 4)
  expect_equal(projectionNumber(s, p), 5)
  expect_equal(projectionNumber(r, s), 3)
  expect_equal(projectionNumber(s, r), 5)
  expect_equal(projectionNumber(rep(0, 10), 1:10), 1)
})


test_that("entropy computation is correct", {
  # Create a large partition of n objects into k clusters
  k <- 1000
  n <- 1000000
  large_partition <- new("Partition", sample(k, n, replace = TRUE))
  # Compute the relative frequencies
  large_partition_relfreq <- as.vector(table(large_partition) / n)
  
  expect_true(entropy(large_partition_relfreq) - log(k) <= .Machine$double.eps^.5)
  expect_equal(entropy(rep(1/k, k)), log(k))
  expect_equal(entropy(c(rep(0, k-1), 1)), 0)
  
  expect_equal(entropy(new("Partition", rep(0, 10))), 0)
  expect_equal(entropy(p), entropy(c(2/5, 3/5)))
  expect_equal(entropy(q), entropy(c(2/5, 3/5)))
  expect_equal(entropy(r), entropy(c(1/5, 4/5)))
  expect_equal(entropy(s), entropy(c(2/5, 2/5, 1/5)))
  
  expect_true(entropy(large_partition) - log(k) <= .Machine$double.eps^.5)
  expect_true(-entropy(large_partition) <= .Machine$double.eps^.5)
})


test_that("registration of vector signatures for measures works correct", {
  # Not registered => error
  pattern <- "unable to find an inherited method for function 'randIndex' for signature '\"numeric\", \"numeric\"'"
  expect_error(randIndex(c(0, 0, 0, 1, 1), c(0, 0, 1, 1, 1)), regexp = pattern)
  
  # Only the "Partition" signature exists
  expect_true(hasMethod("randIndex", c("Partition", "Partition")))
  expect_false(hasMethod("randIndex", c("vector", "vector")))
  
  # Register
  expect_silent(registerPartitionVectorSignatures(environment()))
  # Now the plain vector signature exists also
  expect_true(hasMethod("randIndex", c("vector", "vector")))
  expect_equal(randIndex(c(0, 0, 0, 1, 1), c(0, 0, 1, 1, 1)), randIndex(p, q))
  
})

