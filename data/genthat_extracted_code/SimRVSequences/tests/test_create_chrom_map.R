library(testthat)
context("create_chrom_map")

#SMALL TOY DATASETS FOR TESTING
toy_muts <- data.frame(colID = seq(1:10),
                       chrom = sample(1:3, size = 10, replace = TRUE),
                       position = round(seq(1001, 2000001, length.out = 10)*1000),
                       pathwaySNV = sample(x = c(TRUE, FALSE), size = 10,
                                           replace = TRUE, prob = c(0.2, 0.8)),
                       is_CRV = sample(c(rep(FALSE, 9), TRUE), size = 10))

toy_muts$marker <- paste0(toy_muts$chrom, sep = "_", toy_muts$position)
toy_muts <- toy_muts[order(toy_muts$chrom, toy_muts$position), ]
rownames(toy_muts) <- NULL



test_that("Returns a row for each unique chromosome in marker map", {
  expect_equal(nrow(create_chrom_map(toy_muts)), length(unique(toy_muts$chrom)))
})

test_that("Correct end postions", {

  ends <- sapply(unique(toy_muts$chrom), function(x){
    max(toy_muts$position[toy_muts$chrom == x])
  })

  expect_equal(create_chrom_map(toy_muts)$end_pos, ends)
})


test_that("Correct start postions", {

  starts <- sapply(unique(toy_muts$chrom), function(x){
    min(toy_muts$position[toy_muts$chrom == x])
  })

  expect_equal(create_chrom_map(toy_muts)$start_pos, starts)
})
