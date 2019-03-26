library(testthat)
context("sim_hapliodFormation")
test_that("sim_hapliodFormation has ncols = length(chiasmata positions) + 2", {

  my_chrom_map <- data.frame(start = round(runif(1, 0, 500)))
  my_chrom_map$stop <- my_chrom_map$start + round(runif(1, 50, 300))
  sim_chias_pos <- sim_chiasmataPositions(my_chrom_map)
  my_haps <- sim_haploidFormation(num_chiasmata = length(sim_chias_pos),
                                  allele_IDs = c(2, 3))
  expect_equal(ncol(my_haps) - 2, length(sim_chias_pos))
})

test_that("sim_hapliodFormation always returns a unique gamete group for each recombined haploid", {

  my_chrom_map <- data.frame(start = round(runif(1, 0, 500)))
  my_chrom_map$stop <- my_chrom_map$start + round(runif(1, 50, 300))
  sim_chias_pos <- sim_chiasmataPositions(my_chrom_map)
  my_haps <- sim_haploidFormation(num_chiasmata = length(sim_chias_pos),
                                  allele_IDs = c(2, 3))

  expect_equal(sort(my_haps$gamete_grp), LETTERS[1:4])
})
