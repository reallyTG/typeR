context("sim_life")
test_that("sim_life should always begin at start and end at death when stop_year is sufficiently large", {
  Levents <- sim_life(hazard_rates = hazard(AgeSpecific_Hazards),
                      GRR = 25, carrier_prob = 0.02, RV_status = T,
                      YOB = 1900, stop_year = 2001,
                      NB_params = c(2, 4/7))

  expect_equal(colnames(Levents)[1], "Start")
  expect_equal(colnames(Levents)[length(Levents)], "Death")
})

test_that("sim_life never returns more than one onset event", {
  onset_occured = FALSE

  while (onset_occured == FALSE) {
    Levents <- sim_life(hazard_rates = hazard(AgeSpecific_Hazards),
                        GRR = 500, carrier_prob = 0.02, RV_status = T,
                        YOB = 1900, stop_year = 2001,
                        NB_params = c(2, 4/7))

    if ("Onset" %in% names(table(colnames(Levents)))) {
      onset_occured = TRUE
    }
  }

  expect_equal(as.numeric(table(colnames(Levents))[names(table(colnames(Levents))) == "Onset"]), 1)

})

test_that("sim_life always returns death event after all other events", {
  Levents <- sim_life(hazard_rates = hazard(AgeSpecific_Hazards),
                      GRR = 50, carrier_prob = 0.02, RV_status = T,
                      YOB = 1900, stop_year = 2001,
                      NB_params = c(2, 4/7))
  Levents <- as.numeric(Levents)
  num_events <- length(Levents)
  expect_equal(sum(Levents[num_events] >= Levents[-num_events])/(num_events - 1),
               1)
})

test_that("sim_life doesn't return any events after the stop year", {
  my_stopY <- 1900 + round(runif(1, min = 10, max = 60))
  Levents <- sim_life(hazard_rates = hazard(AgeSpecific_Hazards),
                      GRR = 50, carrier_prob = 0.02, RV_status = T,
                      YOB = 1900, stop_year = my_stopY,
                      NB_params = c(2, 4/7))

  Levents <- as.numeric(Levents)
  expect_gte(my_stopY, Levents[length(Levents)])
})
