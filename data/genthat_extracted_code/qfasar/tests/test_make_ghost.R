library(qfasar)
context("Test ghost signature")

test_obj <- make_ghost(prey_sigs = matrix(c(0.05, 0.10, 0.30, 0.55,
                                            0.04, 0.11, 0.29, 0.56,
                                            0.10, 0.05, 0.35, 0.50,
                                            0.12, 0.03, 0.37, 0.48,
                                            0.10, 0.06, 0.35, 0.49,
                                            0.05, 0.15, 0.35, 0.45), ncol=6),
                       loc = matrix(c(1, 3, 5, 2, 4, 6), ncol=2))


test_that("Objective function is correct",{
  expect_equivalent(round(test_obj$dist, 3), 3.751)
  expect_equivalent(round(test_obj$sig, 2),
                    c(0.14, 0.03, 0.22, 0.61))

})
