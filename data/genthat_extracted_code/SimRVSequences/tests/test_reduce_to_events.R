library(testthat)
context("reduce_to_events")

test_that("reduce_to_events returns the appropriate number of crossovers", {


  #create coded inherited haplotype list,
  haplo_vec <- sample(x = c(2, 3), size = sample(1:10, size = 1), replace = TRUE)

  #calculate the number of actual crossovers,
  #NOTE this is one less than the number of items in haplo_vec
  num_swaps <- length(rle(as.numeric(haplo_vec))$values) - 1

  #sample chiasmata locations
  chias_vec <- cumsum(rgamma((length(haplo_vec) - 1), shape = 2.63, rate = 2*2.63))

  #supply coded haplotype and chiasmata locations to reduce_to_events
  r2e <- reduce_to_events(gamete_haplo = haplo_vec, chias_locations = chias_vec)

  expect_equal(num_swaps, length(rle(as.numeric(r2e))$values))
})

test_that("reduce_to_events keeps the appropriate chiasmata locations", {

  #create coded inherited haplotype list,
  haplo_vec <- sample(x = c(2, 3), size = sample(1:10, size = 1), replace = TRUE)
  haplo_vec

  #store the assumed postions of the future chiasmata
  rl = rle(as.numeric(haplo_vec))$lengths

  #sample chiasmata locations
  chias_vec <- cumsum(rgamma((length(haplo_vec) - 1), shape = 2.63, rate = 2*2.63))

  #supply coded haplotype and chiasmata locations to reduce_to_events
  r2e <- reduce_to_events(gamete_haplo = haplo_vec, chias_locations = chias_vec)

  expect_equal(r2e, chias_vec[cumsum(rl[-length(rl)])])
})

