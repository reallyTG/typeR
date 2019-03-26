context("get_wait_prob")
test_that("wait_prob return is between 0 and 1", {
  expect_equal(get_wait_prob(last_event = 0, wait_time = 100,
                             hazard = AgeSpecific_Hazards[,2],
                             part = seq(0, 100, by = 1),
                             scale = TRUE), 1)
  expect_equal(get_wait_prob(last_event = 0, wait_time = 0,
                             hazard = AgeSpecific_Hazards[,2],
                             part = seq(0, 100, by = 1),
                             scale = TRUE), 0)
  expect_lte(get_wait_prob(last_event = 0, wait_time = 100,
                           hazard = AgeSpecific_Hazards[,2],
                           part = seq(0, 100, by = 1)), 1)
  expect_gte(get_wait_prob(last_event = 0, wait_time = 100,
                           hazard = AgeSpecific_Hazards[,2],
                           part = seq(0, 100, by = 1)), 0)
})
