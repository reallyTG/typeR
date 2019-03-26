context("choose_proband")
test_that("returns a dataframe with the proband variable with a single proband", {
  RVped <- sim_RVped(hazard_rates = hazard(AgeSpecific_Hazards),
                     GRR = 50, carrier_prob = 0.002,
                     RVfounder = TRUE,
                     FamID = 1,
                     num_affected = 2,
                     recall_probs = c(1),
                     founder_byears = c(1900, 1980),
                     ascertain_span = c(1970, 2015))[[1]][, c(1:14)]

  Tped = choose_proband(ped_file = RVped, num_affected = 2,
                        ascertain_span = c(1970, 2015),
                        first_diagnosis = NULL)

  expect_true("proband" %in% colnames(Tped))
  expect_equal(sum(Tped$proband), 1)
})

test_that("The proband is an affected and experienced onset during the ascertainment span", {
  RVped <- sim_RVped(hazard_rates = hazard(AgeSpecific_Hazards),
                     GRR = 50, carrier_prob = 0.001,
                     RVfounder = TRUE,
                     FamID = 1,
                     num_affected = 2,
                     recall_probs = c(1),
                     founder_byears = c(1900, 1970),
                     ascertain_span = c(1980, 2015))[[1]][, c(1:14)]

  Tped = choose_proband(ped_file = RVped, num_affected = 2,
                        ascertain_span = c(1970, 2015),
                        first_diagnosis = NULL)


  expect_true(Tped$affected[Tped$proband] == 1)
  expect_true(Tped$onsetYr[Tped$proband] >= 1970 &
                Tped$onsetYr[Tped$proband] <= 2015)

})
