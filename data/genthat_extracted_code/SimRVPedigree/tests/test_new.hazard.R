context("hazard")

test_that("issues errors when invalid partition supplied", {
  expect_error(hazard(partition = seq(1, 100, by = 1),
                      hazardDF = AgeSpecific_Hazards))
})

test_that("issues error when hazardDF contains fewer than 3 columns", {
  expect_error(hazard(partition = seq(0, 100, by = 1),
                      hazardDF = AgeSpecific_Hazards[, c(1,2)]))
})

test_that("issues error when hazard contains NA values", {
  HR = rbind(AgeSpecific_Hazards[c(1:99),], c(NA, 1, 1))
  expect_error(hazard(partition = seq(0, 100, by = 1),
                      hazardDF = HR))
})

test_that("issues error when part contains NA values", {
  expect_error(hazard(partition = c(NA, seq(1, 100, by = 1)),
                      hazardDF = AgeSpecific_Hazards))
})

test_that("issues error when part doesn't start at zero", {
  expect_error(sim_RVped(hazardDF = AgeSpecific_Hazards,
                         part = seq(50, 100, by = 0.5),
                         GRR = 35, prob_causalRV = 1, FamID = 1,
                         num_affected = 2,
                         founder_byears = c(1900, 1980),
                         ascertain_span = c(2000, 2015)))
})
