context("get_nextEvent")
test_that("If current age > max birth age and disease status = 1, next event is death", {
  expect_equal(get_nextEvent(current_age = 46,
                             disease_status = 1,
                             RV_status = 1,
                             hazard_rates = hazard(AgeSpecific_Hazards),
                             GRR = 5,
                             carrier_prob = 0.02,
                             lambda_birth = 0.05,
                             birth_range = c(18, 45))[[2]]
               , "Death")
})
