library(testthat)
context("sim_chiasmataPositions")
test_that("sim_chiasmataPositions should never return a chiasmata position outside of the bounds specified by chrom_endPoints", {

  B <- 0
  while (B == 0) {
    my_endPoints <- data.frame(start = round(runif(1, 0, 500)))
    my_endPoints$stop <- my_endPoints$start + round(runif(1, 50, 300))

    ex_chiasPos <- sim_chiasmataPositions(chrom_map = my_endPoints)
    B <- length(ex_chiasPos)
  }

  expect_lt(my_endPoints[1, 1], ex_chiasPos[1])
  expect_gt(my_endPoints[1, 2], ex_chiasPos[length(ex_chiasPos)])

})

test_that("successive chiasmata locations returned by sim_chiasmataPositions should always be strictly increasing", {

  #simualte chiasmata until at least 2 are formed
  B <- 0
  while (B < 2) {
    my_endPoints <- data.frame(start = round(runif(1, 0, 500)))
    my_endPoints$stop <- my_endPoints$start + round(runif(1, 50, 300))

    ex_chiasPos <- sim_chiasmataPositions(chrom_map = my_endPoints)
    B <- length(ex_chiasPos)
  }

  expect_true(all(diff(ex_chiasPos) >= 0))
})


test_that("If start_pos = end_pos no chiasmata are formed", {

    my_endPoints <- data.frame(start = 1,
                               stop = 1)

    ex_chiasPos <- sim_chiasmataPositions(chrom_map = my_endPoints)

    expect_equal(length(ex_chiasPos), 0)
})
