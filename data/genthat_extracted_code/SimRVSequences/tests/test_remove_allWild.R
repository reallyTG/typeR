library(testthat)
library(Matrix)
context("remove_allWild")

data("study_peds")
#SMALL TOY DATASETS FOR TESTING
toy_haps <- sparseMatrix(i = seq(1:10), j = seq(1:10), x = rep(1, 10))
toy_muts <- data.frame(colID = seq(1:10),
                       chrom = rep(1, 10),
                       position = round(seq(1001, 2000001, length.out = 10)*1000),
                       pathwaySNV = sample(x = c(TRUE, FALSE), size = 10,
                                           replace = TRUE, prob = c(0.2, 0.8)),
                       is_CRV = sample(c(rep(FALSE, 9), TRUE), size = 10))

toy_muts$marker = paste0(toy_muts$chrom, sep = "_", toy_muts$position)

test_that("removes/retains the correct SNVs", {
  Hap_dat = list(list(toy_haps[sample(1:10, size = 4), ], c(1, 1, 2, 2)))

  #determine which columns should be retained
  keepSNVs <- toy_muts$marker[which(colSums(Hap_dat[[1]][[1]]) != 0)]

  #determine which columns are retained
  reduced_dat <- remove_allWild(Hap_dat, toy_muts)[[2]]$marker

  expect_equal(keepSNVs, reduced_dat)

})
