library(qfasar)
context("Test pooling of diet estimates")

test_obj <- diet_pool(rep_grp = matrix(c(1, 0, 0, 0, 0, 0, 0,
                                         0, 1, 0, 0, 0, 0, 0,
                                         0, 1, 0, 0, 0, 0, 0,
                                         0, 0, 1, 0, 0, 0, 0,
                                         0, 0, 0, 1, 0, 0, 0,
                                         0, 0, 0, 1, 0, 0, 0,
                                         0, 0, 0, 0, 1, 0, 0,
                                         0, 0, 0, 0, 0, 1, 0,
                                         0, 0, 0, 0, 0, 1, 0,
                                         0, 0, 0, 0, 0, 0, 1),
                                       nrow = 10, byrow = TRUE),
                      est_ind = matrix(c(0.116, 0.315,
                                         0.028, 0.073,
                                         0.000, 0.000,
                                         0.131, 0.120,
                                         0.000, 0.000,
                                         0.000, 0.000,
                                         0.723, 0.452,
                                         0.000, 0.000,
                                         0.000, 0.000,
                                         0.002, 0.040),
                                       nrow = 10, byrow = TRUE))

test_that("First diet is correct",{
  expect_equivalent(round(test_obj$est_ind[,1], 3),
                    c(0.116, 0.028, 0.131, 0.000, 0.723, 0.000, 0.002))
})

test_that("Second diet is correct",{
  expect_equivalent(round(test_obj$est_ind[,2], 3),
                    c(0.315, 0.073, 0.120, 0.000, 0.452, 0.000, 0.040))
})
