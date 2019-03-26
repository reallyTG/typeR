library(qfasar)
context("Test CC augmentation")


# Default values
test_obj <- cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                                      0.04, 0.11, 0.29, 0.56,
                                      0.10, 0.05, 0.35, 0.50), ncol = 3),
                   sig_scale = matrix(c(0.40, 0.50, 0.10,
                                        0.45, 0.49, 0.06,
                                        0.35, 0.45, 0.20), ncol = 3),
                   cc_all = c(0.75, 1.05, 1.86, 0.80),
                   use_fa = c(FALSE, FALSE, TRUE, TRUE))

test_that("CC augmentation is correct",{
  expect_equivalent(round(test_obj$cc, 3),
                    c(1.860, 0.800, 1.467))
})


# Distance measure equals 1
test_obj <- cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                                      0.04, 0.11, 0.29, 0.56,
                                      0.10, 0.05, 0.35, 0.50), ncol = 3),
                   sig_scale = matrix(c(0.40, 0.50, 0.10,
                                        0.45, 0.49, 0.06,
                                        0.35, 0.45, 0.20), ncol = 3),
                   cc_all = c(0.75, 1.05, 1.86, 0.80),
                   use_fa = c(FALSE, FALSE, TRUE, TRUE),
                   dist_meas = 1)

test_that("CC augmentation is correct",{
  expect_equivalent(round(test_obj$cc, 3),
                    c(1.860, 0.800, 1.467))
})


# Distance measure equals 2
test_obj <- cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                                      0.04, 0.11, 0.29, 0.56,
                                      0.10, 0.05, 0.35, 0.50), ncol = 3),
                   sig_scale = matrix(c(0.40, 0.50, 0.10,
                                        0.45, 0.49, 0.06,
                                        0.35, 0.45, 0.20), ncol = 3),
                   cc_all = c(0.75, 1.05, 1.86, 0.80),
                   use_fa = c(FALSE, FALSE, TRUE, TRUE),
                   dist_meas = 2)

test_that("CC augmentation is correct",{
  expect_equivalent(round(test_obj$cc, 3),
                    c(1.860, 0.800, 1.187))
})


# Distance measure equals 3, gamma equals 0.25
test_obj <- cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                                      0.04, 0.11, 0.29, 0.56,
                                      0.10, 0.05, 0.35, 0.50), ncol = 3),
                   sig_scale = matrix(c(0.40, 0.50, 0.10,
                                        0.45, 0.49, 0.06,
                                        0.35, 0.45, 0.20), ncol = 3),
                   cc_all = c(0.75, 1.05, 1.86, 0.80),
                   use_fa = c(FALSE, FALSE, TRUE, TRUE),
                   dist_meas = 3,
                   gamma = 0.25)

test_that("CC augmentation is correct",{
  expect_equivalent(round(test_obj$cc, 3),
                    c(1.860, 0.800, 1.424))
})


# Distance measure equals 3, default gamma
test_obj <- cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                                      0.04, 0.11, 0.29, 0.56,
                                      0.10, 0.05, 0.35, 0.50), ncol = 3),
                   sig_scale = matrix(c(0.40, 0.50, 0.10,
                                        0.45, 0.49, 0.06,
                                        0.35, 0.45, 0.20), ncol = 3),
                   cc_all = c(0.75, 1.05, 1.86, 0.80),
                   use_fa = c(FALSE, FALSE, TRUE, TRUE),
                   dist_meas = 3)

test_that("CC augmentation is correct",{
  expect_equivalent(round(test_obj$cc, 3),
                    c(1.860, 0.800, 0.833))
})
