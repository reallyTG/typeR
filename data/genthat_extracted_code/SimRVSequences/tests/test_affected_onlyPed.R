library(testthat)
library(Matrix)
library(SimRVPedigree)
context("affected_onlyPed")
data("AgeSpecific_Hazards")

#---------------------#
# Errors and Warnings #
#---------------------#

test_that("Warning: some pedigrees do not contain affecteds and affected_only = TRUE", {
  tPed <- sim_RVped(hazard_rates = hazard(AgeSpecific_Hazards),
                    GRR = 50, FamID = 1,
                    RVfounder = TRUE,
                    founder_byears = c(1900, 1920),
                    ascertain_span = c(1980, 2010),
                    stop_year = 2018,
                    recall_probs = c(1, 0.5, 0),
                    num_affected = 2)[[2]]

  redPed <- affected_onlyPed(tPed)

  expect_false(any(is.na(redPed$affected)))
})
