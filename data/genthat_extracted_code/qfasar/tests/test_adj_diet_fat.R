library(qfasar)
context("Test fat conversion")

test_obj <- adj_diet_fat(prey_fat = c(0.5, 1, 2),
                         diet_est = c(0.3, 0.2, 0.5),
                         diet_var = matrix(c( 0.030,  0.004, -0.003,
                                              0.004,  0.025, -0.007,
                                             -0.003, -0.007,  0.045),
                                           nrow = 3, ncol = 3))

test_that("Fat conversion with variance is correct",{
          expect_equivalent(round(test_obj$diet_est, 3),
                            c(0.571, 0.190, 0.238))
})


test_obj <- adj_diet_fat(prey_fat = c(0.5, 1, 2),
                         diet_est = c(0.3, 0.2, 0.5))

test_that("Fat conversion without variance is correct",{
  expect_equivalent(round(test_obj$diet_est, 3),
                    c(0.571, 0.190, 0.238))
})
