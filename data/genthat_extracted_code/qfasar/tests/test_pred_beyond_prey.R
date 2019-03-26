library(qfasar)
context("Test predator out of prey range")

test_obj <- pred_beyond_prey(pred_sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                                  0.04, 0.11, 0.29, 0.56,
                                                  0.10, 0.05, 0.35, 0.50,
                                                  0.12, 0.03, 0.37, 0.48,
                                                  0.10, 0.06, 0.35, 0.49,
                                                  0.05, 0.15, 0.35, 0.45), ncol = 6),
                             prey_sigs = matrix(c(0.06, 0.09, 0.31, 0.54,
                                                  0.05, 0.09, 0.30, 0.56,
                                                  0.03, 0.10, 0.30, 0.57,
                                                  0.08, 0.07, 0.30, 0.55,
                                                  0.09, 0.05, 0.33, 0.53,
                                                  0.09, 0.06, 0.34, 0.51,
                                                  0.09, 0.07, 0.34, 0.50,
                                                  0.08, 0.11, 0.35, 0.46,
                                                  0.06, 0.14, 0.36, 0.44), ncol = 9),
                             mean_sigs = matrix(c(0.047, 0.093, 0.303, 0.557,
                                                  0.087, 0.050, 0.323, 0.530,
                                                  0.077, 0.106, 0.350, 0.467), ncol = 3))

test_that("Pred beyond prey is correct",{
  expect_equivalent(as.numeric(table(test_obj$beyond_ind)),
                    c(17, 7))
  expect_equivalent(as.numeric(table(test_obj$beyond_mean)),
                    c(12, 12))
})
