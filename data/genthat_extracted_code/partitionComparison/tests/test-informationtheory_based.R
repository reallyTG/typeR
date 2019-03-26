library(testthat)
library(partitionComparison)
context("Information theory based comparison measures")

test_that("the mutual information works correctly", {
  random_partition_cluster_sizes <- as.vector(table(random_partition))
  n <- length(random_partition)
  # log(n) - sum(n_i log n_i) / n
  random_partition_max_mi <- log(n) - sum(sapply(random_partition_cluster_sizes, 
                                                 function(s) s*log(s))) / n
  expect_equal(mutualInformation(random_partition, random_partition), 
               random_partition_max_mi)
  
  expect_equal(mutualInformation(p, q), 4/5*log(5/3) + 1/5*log(5/9))
  expect_equal(mutualInformation(q, p), 4/5*log(5/3) + 1/5*log(5/9))
  expect_equal(mutualInformation(p, r), 2/5*log(5/4) + 2/5*log(5/6) + 1/5*log(5/3))
  expect_equal(mutualInformation(p, s), 2/5*log(5/2) + 1/5*log(5/3) + 2/5*log(5/3))
  expect_equal(mutualInformation(r, s), 2/5*log(5/4) + 2/5*log(5/4) + 1/5*log(5))
})

test_that("the normalized mutual information works correctly", {
  expect_equal(normalizedMutualInformation(random_partition, random_partition, "min"), 1)
  expect_equal(normalizedMutualInformation(random_partition, random_partition, "max"), 1)
  expect_equal(normalizedMutualInformation(random_partition, random_partition, "sum"), 1)

  mi_pp <- log(5) - (2*log(2) + 3*log(3))/5  # = mi_qq
  mi_rr <- log(5) - (4*log(4))/5
  mi_ss <- log(5) - (4*log(2))/5
  
  nmi_pq <- (4/5*log(5/3) + 1/5*log(5/9)) / mi_pp
  expect_equal(normalizedMutualInformation(p, q, "min"), nmi_pq)
  expect_equal(normalizedMutualInformation(p, q, "max"), nmi_pq)
  expect_equal(normalizedMutualInformation(p, q, "sum"), nmi_pq)
  
  expect_equal(normalizedMutualInformation(q, p, "min"), nmi_pq)
  expect_equal(normalizedMutualInformation(q, p, "max"), nmi_pq)
  expect_equal(normalizedMutualInformation(q, p, "sum"), nmi_pq)
  
  mi_pr <- 2/5*log(5/4) + 2/5*log(5/6) + 1/5*log(5/3)
  expect_equal(normalizedMutualInformation(p, r, "min"), mi_pr / min(mi_pp, mi_rr))
  expect_equal(normalizedMutualInformation(p, r, "max"), mi_pr / max(mi_pp, mi_rr))
  expect_equal(normalizedMutualInformation(p, r, "sum"), 2 * mi_pr / (mi_pp + mi_rr))
  
  mi_ps <- 2/5*log(5/2) + 1/5*log(5/3) + 2/5*log(5/3)
  expect_equal(normalizedMutualInformation(p, s, "min"), mi_ps / min(mi_pp, mi_ss))
  expect_equal(normalizedMutualInformation(p, s, "max"), mi_ps / max(mi_pp, mi_ss))
  expect_equal(normalizedMutualInformation(p, s, "sum"), 2 * mi_ps / (mi_pp + mi_ss))
  
  mi_rs <- 2/5*log(5/4) + 2/5*log(5/4) + 1/5*log(5)
  expect_equal(normalizedMutualInformation(r, s, "min"), mi_rs / min(mi_rr, mi_ss))
  expect_equal(normalizedMutualInformation(r, s, "max"), mi_rs / max(mi_rr, mi_ss))
  expect_equal(normalizedMutualInformation(r, s, "sum"), 2 * mi_rs / (mi_rr + mi_ss))
  
})

test_that("the variation of information  works correctly", {
  expect_equal(variationOfInformation(random_partition, random_partition), 0)

  # H(X) = MI(X, X)! (Same values as above)
  h_p <- log(5) - (2*log(2) + 3*log(3))/5  # = h_q
  h_r <- log(5) - (4*log(4))/5
  h_s <- log(5) - (4*log(2))/5
  
  # These tests are a bit redundant, as long as entropy and mutualInformation work correctly
  expect_equal(variationOfInformation(p, q), h_p + h_p - 2*(4/5*log(5/3) + 1/5*log(5/9)))
  expect_equal(variationOfInformation(q, p), h_p + h_p - 2*(4/5*log(5/3) + 1/5*log(5/9)))
  expect_equal(variationOfInformation(p, r), 
               h_p + h_r - 2*(2/5*log(5/4) + 2/5*log(5/6) + 1/5*log(5/3)))
  expect_equal(variationOfInformation(p, s), 
               h_p + h_s - 2*(2/5*log(5/2) + 1/5*log(5/3) + 2/5*log(5/3)))
  expect_equal(variationOfInformation(r, s), 
               h_r + h_s - 2*(2/5*log(5/4) + 2/5*log(5/4) + 1/5*log(5)))
})
