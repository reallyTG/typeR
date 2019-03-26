# unit tests for conditionalReordering
context("conditionalReordering")

test_that("conditionalReordering is ok", {

  # let us first check the types
  list.correlation.matrix <- list(base = list(),
                                  scenario1 = matrix(c(1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       0.35,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario2 = matrix(c(1,0.6,0.5,0.25,
                                                       0.6,1,1,0.35,
                                                       0.5,0.8,1,0.35,
                                                       0.25,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario3 = matrix(c(1,0.25,0.25,0.5,
                                                       0.25,1,0.25,0.25,
                                                       0.25,0.25,1,0.25,
                                                       0.5,0.25,0.25,1), ncol=4, byrow = T))

  # define the region boundaries (i.e. the thresholds t)
  region.boundaries <- matrix(c(0.2,0.3,0.3,0.5,
                                0.5,0.2,0.2,0.8,
                                0.6,0.8,0.8,0.2), nrow=3, byrow = T)
  colnames(region.boundaries) <- c("market", "life","health","nonlife")
  rownames(region.boundaries) <- c("scenario1", "scenario2", "scenario3")

  # scenario and region probabilities
  scenario.probability  = c(0.01, 0.01, 0.01)
  region.probability    = c(0.023, 0.034, 0.107)

  # wrong type
  expect_error(conditionalReordering(n = 10^6,
                                     list.correlation.matrix = list.correlation.matrix,
                                     scenario.probability    = scenario.probability,
                                     name = c("market", "life","health","nonlife"),
                                     region.probability      = region.probability,
                                     region.boundaries       = region.boundaries), "types")

  list.correlation.matrix <- list(base = matrix(c(1,1,0.35,
                                                  1,1,0.35,
                                                  1,1,0.35,
                                                  0.35,0.35,1), ncol=4, byrow = T),
                                  scenario1 = matrix(c(1,1,0.35,
                                                       1,1,0.35,
                                                       1,1,0.35,
                                                       0.35,0.35,1), ncol=4, byrow = T),
                                  scenario2 = matrix(c(0.6,0.5,0.25,
                                                       1,1,0.35,
                                                       0.8,1,0.35,
                                                       0.35,0.35,1), ncol=4, byrow = T),
                                  scenario3 = matrix(c(0.25,0.25,0.5,
                                                       1,0.25,0.25,
                                                       0.25,1,0.25,
                                                       0.25,0.25,1), ncol=4, byrow = T))

  # not all of the same dim
  expect_error(conditionalReordering(n = 10^6,
                                     list.correlation.matrix = list.correlation.matrix,
                                     scenario.probability    = scenario.probability,
                                     name = c("market", "life","health","nonlife"),
                                     region.probability      = region.probability,
                                     region.boundaries       = region.boundaries), "square")

  list.correlation.matrix <- list(base = matrix(c(1,0,0,1),byrow = T, ncol=2),
                                  scenario1 = matrix(c(1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       0.35,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario2 = matrix(c(1,0.6,0.5,0.25,
                                                       0.6,1,1,0.35,
                                                       0.5,0.8,1,0.35,
                                                       0.25,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario3 = matrix(c(1,0.25,0.25,0.5,
                                                       0.25,1,0.25,0.25,
                                                       0.25,0.25,1,0.25,
                                                       0.5,0.25,0.25,1), ncol=4, byrow = T))
  # not square matrix
  expect_error(conditionalReordering(n = 10^6,
                                     list.correlation.matrix = list.correlation.matrix,
                                     scenario.probability    = scenario.probability,
                                     name = c("market", "life","health","nonlife"),
                                     region.probability      = region.probability,
                                     region.boundaries       = region.boundaries), "dimension")

  # check semi def pos
  list.correlation.matrix <- list(base = matrix(diag(-1,4), ncol=4, byrow = T),
                                  scenario1 = matrix(c(1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       0.35,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario2 = matrix(c(1,0.6,0.5,0.25,
                                                       0.6,1,0.8,0.35,
                                                       0.5,0.8,1,0.35,
                                                       0.25,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario3 = matrix(c(1,0.25,0.25,0.5,
                                                       0.25,1,0.25,0.25,
                                                       0.25,0.25,1,0.25,
                                                       0.5,0.25,0.25,1), ncol=4, byrow = T))

  list.correlation.matrix <- lapply(list.correlation.matrix, function(corr) {rownames(corr) <- colnames(corr) <- c("market", "life","health","nonlife"); corr})


  expect_error(conditionalReordering(n = 10^6,
                                     list.correlation.matrix = list.correlation.matrix,
                                     scenario.probability    = scenario.probability,
                                     name = c("market", "life","health","nonlife"),
                                     region.probability      = region.probability,
                                     region.boundaries       = region.boundaries), "definite")



  # define the inputs as in the document (please not that the boundary regions are flipped)

  # list of the 4 correlation matrices (base == c0 + other
  # scenario correlation.matrices)
  list.correlation.matrix <- list(base = matrix(c(1,0.15,0.075,0.15,
                                                  0.15,1,0.25,0.25,
                                                  0.075,0.25,1,0.15,
                                                  0.15,0.25,0.15,1), ncol=4, byrow = T),
                                  scenario1 = matrix(c(1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       0.35,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario2 = matrix(c(1,0.6,0.5,0.25,
                                                       0.6,1,0.8,0.35,
                                                       0.5,0.8,1,0.35,
                                                       0.25,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario3 = matrix(c(1,0.25,0.25,0.5,
                                                       0.25,1,0.25,0.25,
                                                       0.25,0.25,1,0.25,
                                                       0.5,0.25,0.25,1), ncol=4, byrow = T))

  list.correlation.matrix <- lapply(list.correlation.matrix, function(corr) {rownames(corr) <- colnames(corr) <- c("market", "life","health","nonlife"); corr})

  # define the region boundaries (i.e. the thresholds t)
  region.boundaries <- matrix(c(0.2,0.3,0.3,0.5,
                                0.5,0.2,0.2,0.8,
                                0.6,0.8,0.8,0.2), nrow=3, byrow = T)

  colnames(region.boundaries) <- c("market", "life","health","nonlife")
  rownames(region.boundaries) <- c("scenario1", "scenario2", "scenario3")

  # scenario and region probabilities
  scenario.probability  = c(0.01, 0.01, 0.01)
  region.probability  = c(0.023, 0.034, 0.107)


  # test with the scenario above
     r <- conditionalReordering(n = 1000,
                                list.correlation.matrix = list.correlation.matrix,
                                scenario.probability    = scenario.probability,
                                name                    = c("market", "life", "health", "nonlife"),
                                region.probability      = region.probability,
                                region.boundaries       = region.boundaries)


})
