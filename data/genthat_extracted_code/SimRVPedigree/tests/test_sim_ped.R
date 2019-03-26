context("sim_ped")
test_that("returns a single ped file dataframe", {
  expect_true(is.data.frame(sim_ped(hazard_rates = hazard(AgeSpecific_Hazards),
                                    GRR = 10, carrier_prob = 0.002,
                                    RVfounder = TRUE,
                                    FamID = 1,
                                    stop_year = 2015,
                                    founder_byears = c(1900, 1905))))
})

test_that("pedigree always contains at least 1 person", {
  expect_true(nrow(sim_ped(hazard_rates = hazard(AgeSpecific_Hazards),
                           GRR = 10, carrier_prob = 0.002,
                           RVfounder = TRUE,
                           FamID = 1, stop_year = 2015,
                           founder_byears = c(1900, 1905))) >= 1)
})

test_that("Effects of RVfounder = 'first' ", {
  exPed <- sim_ped(hazard_rates = hazard(AgeSpecific_Hazards),
                   GRR = 10, carrier_prob = 0.002,
                   RVfounder = TRUE,
                   FamID = 1, stop_year = 2015,
                   founder_byears = c(1900, 1905))

  #expect that first founder introduces causal variant
  expect_true(1 %in% exPed[1, c(7,8)])
  #expect that only one founder introduces causal variant
  expect_true(sum(exPed[which(is.na(exPed$dadID)), c(7, 8)]) == 1)
  #expect that no children are heterozygous at the disease locus
  expect_true(!any(exPed$DA1 + exPed$DA2 == 2))
})

test_that("If GRR = 1", {
  exPed <- sim_ped(hazard_rates = hazard(AgeSpecific_Hazards),
                   GRR = 1, carrier_prob = 0.002,
                   FamID = 1, stop_year = 2015,
                   founder_byears = c(1900, 1905))

  #expect that no founder introduce causal variant
  expect_true(!any(exPed[, c(7,8)] == 1))
})

test_that("issues error when hazard_rates is not a hazard object", {
  expect_error(sim_ped(hazard_rates = AgeSpecific_Hazards,
                       GRR = 1, carrier_prob = 0.002,
                       FamID = 1, stop_year = 2015,
                       founder_byears = c(1900, 1905),
                       RVfounder = TRUE))
})
