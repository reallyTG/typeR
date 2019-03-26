context("sim_founderRVstatus")
test_that("If GRR = 1, always returns d = (0, 0) and RR = 1, and leaves intro_RV unchanged", {
  expect_equal(sim_founderRVstatus(GRR = 1, carrier_prob = 0.02,
                                   RVfounder = TRUE),
               list(c(0, 0), 1))
  expect_equal(sim_founderRVstatus(GRR = 1, carrier_prob = 0.02,
                                   RVfounder = FALSE),
               list(c(0, 0), 1))
})

test_that("RVfounder = TRUE settings", {
  first_ex <- sim_founderRVstatus(GRR = 10, carrier_prob = 0.02,
                                  RVfounder = TRUE)
  expect_true(1 %in% first_ex[[1]])
  expect_equal(first_ex[[2]], 10)

})


test_that("RVfounder = FALSE settings", {
  first_ex <- sim_founderRVstatus(GRR = 10, carrier_prob = 1,
                                  RVfounder = FALSE)
  expect_true(0 %in% first_ex[[1]])
  expect_true(1 %in% first_ex[[1]])
  expect_equal(first_ex[[2]], 10)
})
