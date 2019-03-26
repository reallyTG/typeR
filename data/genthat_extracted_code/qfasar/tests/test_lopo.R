library(qfasar)
context("Test leave-one-prey-out")

test_obj <- lopo(sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                 0.04, 0.11, 0.29, 0.56,
                                 0.10, 0.05, 0.35, 0.50,
                                 0.12, 0.03, 0.37, 0.48,
                                 0.10, 0.06, 0.35, 0.49,
                                 0.05, 0.15, 0.35, 0.45), ncol=6),
                 type = c("Type_1", "Type_1", "Type_2", "Type_2", "Type_3", "Type_3"),
                 uniq_types = c("Type_1", "Type_2", "Type_3"),
                 type_ss <- c(2, 2, 2),
                 loc = matrix(c(1, 3, 5, 2, 4, 6), ncol=2),
                 dist_meas = 1)

test_that("Distance measure 1",{
  expect_equivalent(round(test_obj$mean_correct, 3), 0.624)
})


test_obj <- lopo(sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                 0.04, 0.11, 0.29, 0.56,
                                 0.10, 0.05, 0.35, 0.50,
                                 0.12, 0.03, 0.37, 0.48,
                                 0.10, 0.06, 0.35, 0.49,
                                 0.05, 0.15, 0.35, 0.45), ncol=6),
                 type = c("Type_1", "Type_1", "Type_2", "Type_2", "Type_3", "Type_3"),
                 uniq_types = c("Type_1", "Type_2", "Type_3"),
                 type_ss <- c(2, 2, 2),
                 loc = matrix(c(1, 3, 5, 2, 4, 6), ncol=2),
                 dist_meas = 2)

test_that("Distance measure 2",{
  expect_equivalent(round(test_obj$mean_correct, 3), 0.638)
})


test_obj <- lopo(sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                 0.04, 0.11, 0.29, 0.56,
                                 0.10, 0.05, 0.35, 0.50,
                                 0.12, 0.03, 0.37, 0.48,
                                 0.10, 0.06, 0.35, 0.49,
                                 0.05, 0.15, 0.35, 0.45), ncol=6),
                 type = c("Type_1", "Type_1", "Type_2", "Type_2", "Type_3", "Type_3"),
                 uniq_types = c("Type_1", "Type_2", "Type_3"),
                 type_ss <- c(2, 2, 2),
                 loc = matrix(c(1, 3, 5, 2, 4, 6), ncol=2),
                 dist_meas = 3)

test_that("Distance measure 3",{
  expect_equivalent(round(test_obj$mean_correct, 3), 0.638)
})
