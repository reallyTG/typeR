library(qfasar)
context("Test lopo pooling")

test_obj <- lopo_pool(est = matrix(c(0.90, 0.05, 0.30, 0.02,
                                     0.04, 0.84, 0.09, 0.03,
                                     0.02, 0.06, 0.35, 0.57,
                                     0.05, 0.10, 0.15, 0.70), nrow = 4, byrow = TRUE),
                      n_conv = c(2, 8, 8, 11),
                      type_ss = c(2, 8, 8, 12),
                      pre = matrix(c(0.2, 0.8, 0.0, 0.0,
                                     0.0, 0.0, 0.4, 0.6), nrow = 2, byrow = TRUE),
                      post = matrix(c(1, 1, 0, 0,
                                      0, 0, 1, 1), ncol = 2)
)

test_that("Fat conversion with variance is correct",{
  expect_equivalent(round(test_obj$mean_correct, 3), 0.886)
})
