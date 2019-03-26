library(grpSLOPE)

context("lambdaGroupSLOPE()")

n.obs <- 50
n.group <- 10
group <- c(10, 4, 7,10, 6, 9, 9, 2, 5, 1, 6, 2, 6, 1, 2, 1,
           2, 1, 5, 9, 5, 1, 3,10, 4, 5, 3, 7, 6, 9)
wt <- sapply(getGroupID(group), length)
A <- as.matrix(read.table("./test_data/gaussianMC_test_mat.txt"))
fdr <- 0.1

test_that("method 'max' computes the sequence correctly", {
  sol <- c(1.499968,1.379613,1.304070,1.247701,1.202159,1.163626,1.130022,1.100084,1.072983)
  lambda.chi <- lambdaGroupSLOPE(fdr=fdr, group=group, wt=wt, method="max")
  expect_equal(lambda.chi, sol, tolerance=1e-6)
})

test_that("method 'mean' computes the sequence correctly", {
  sol <- c(1.3071436,1.1713664,1.0866840,1.0245727,0.9755941,0.9353226,0.9012584,0.8717645,0.8459121)
  lambda.chi <- lambdaGroupSLOPE(fdr=fdr, group=group, wt=wt, method="mean")
  expect_equal(lambda.chi, sol, tolerance=1e-6)
})

test_that("method 'corrected' computes the sequence correctly when all group sizes are equal", {
  sol <- c(1.636351,1.532511,1.466937,1.417591,1.377319)
  eqgrp <- rep(1:5,5)
  eqwt <- rep(sqrt(5), 5)
  names(eqwt) <- 1:5
  lambda.chi <- lambdaGroupSLOPE(fdr=fdr, group=eqgrp, wt=eqwt,
                                 n.obs=1000, method="corrected")
  expect_equal(lambda.chi, sol, tolerance=1e-6)
})

test_that("method 'corrected' computes the sequence correctly", {
  sol <- c(1.307144,1.250211,1.250211,1.250211,1.250211,1.250211,1.250211,1.250211,1.250211)
  lambda.chi <- lambdaGroupSLOPE(fdr=fdr, group=group, wt=wt, n.obs=n.obs, method="corrected")
  expect_equal(lambda.chi, sol, tolerance=1e-6)
})
