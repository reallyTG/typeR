context("assign_gen")

test_that("returns a ped with the correct generations", {
  EXPed <- sim_RVped(hazard_rates = hazard(AgeSpecific_Hazards),
                     GRR = 50, carrier_prob = 0.002,
                     RVfounder = TRUE,
                     FamID = 1,
                     num_affected = 2,
                     recall_probs = c(1),
                     founder_byears = c(1900, 1910),
                     ascertain_span = c(1900, 2017))[[2]]
  expect_equal(EXPed$Gen, assign_gen(EXPed[, -14]))
})
