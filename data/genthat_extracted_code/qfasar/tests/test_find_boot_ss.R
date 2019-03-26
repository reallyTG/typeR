library(qfasar)
context("Test bootstrap sample size algorithm")

test_obj <- find_boot_ss(pred_sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                              0.04, 0.11, 0.29, 0.56,
                                              0.10, 0.05, 0.35, 0.50,
                                              0.12, 0.03, 0.37, 0.48,
                                              0.10, 0.06, 0.35, 0.49,
                                              0.05, 0.15, 0.35, 0.45), ncol = 6),
                         pred_diets = matrix(c(0.33, 0.34, 0.33,
                                               0.10, 0.80, 0.10,
                                               0.35, 0.50, 0.15,
                                               0.20, 0.35, 0.45,
                                               0.20, 0.45, 0.35,
                                               0.15, 0.65, 0.20), ncol = 6),
                         prey_sigs = matrix(c(0.06, 0.09, 0.31, 0.54,
                                              0.05, 0.09, 0.30, 0.56,
                                              0.03, 0.10, 0.30, 0.57,
                                              0.08, 0.07, 0.30, 0.55,
                                              0.09, 0.05, 0.33, 0.53,
                                              0.09, 0.06, 0.34, 0.51,
                                              0.09, 0.07, 0.34, 0.50,
                                              0.08, 0.11, 0.35, 0.46,
                                              0.06, 0.14, 0.36, 0.44), ncol = 9),
                         prey_loc = matrix(c(1, 4, 7, 3, 6, 9), ncol=2),
                         n_pred_boot = 500)


test_that("Variance target computation is correct",{
  expect_equivalent(round(test_obj$var_target, 4), 0.0051)
})


