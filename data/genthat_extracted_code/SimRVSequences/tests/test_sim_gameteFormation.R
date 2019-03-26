library(testthat)
context("sim_gameteFormation")
test_that("sim_gameteFormation returns 2 lists each with the same length as the number of rows in chrom_map", {

  n_chroms = round(runif(1, 1, 4))
  my_chrom_map <- data.frame(chrom = c(1:n_chroms),
                             start = round(runif(n_chroms, 0, 100)))
  my_chrom_map$stop <- my_chrom_map$start + round(runif(n_chroms, 250, 400))
  my_chrom_map$center <- round(my_chrom_map$start + 0.2*(my_chrom_map$stop - my_chrom_map$start))


  my_gams <- sim_gameteFormation(chrom_map = my_chrom_map,
                                 allele_IDs = c(0, 1))


  expect_equal(length(my_gams[[1]]), nrow(my_chrom_map))
  expect_equal(length(my_gams[[2]]), nrow(my_chrom_map))
})
