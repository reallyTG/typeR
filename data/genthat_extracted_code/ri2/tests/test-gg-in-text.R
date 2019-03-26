context("Gerber and Green in text example")


test_that("Basic Two Arm Trial", {

  # By hand
  table_2.2 <- data.frame(
    d = c(1, 0, 0, 0, 0, 0, 1),
    y = c(15, 15, 20, 20, 10, 15, 30)
  )


  perms <- combn(7, 2, tabulate, nbins = 7)
  sims <- ncol(perms)

  observed_ate <- with(table_2.2, mean(y[d == 1]) - mean(y[d == 0]))
  simulated_ates <- rep(NA, sims)

  for (i in 1:sims) {
    table_2.2$Z_sim <- perms[, i]
    simulated_ates[i] <- with(table_2.2, mean(y[Z_sim == 1]) - mean(y[Z_sim == 0]))
  }

  p_two_tailed <- mean(abs(simulated_ates) >= abs(observed_ate))
  p_upper <- mean(simulated_ates >= observed_ate)
  p_lower <- mean(simulated_ates <= observed_ate)

  # IN ri2

  # Declare randomization procedure
  declaration <- declare_ra(N = 7, m = 2)

  # Conduct Randomization Inference
  ri2_out <- conduct_ri(y ~ d,
    declaration = declaration,
    assignment = "d",
    sharp_hypothesis = 0,
    data = table_2.2
  )


  expect_equal(summary(ri2_out, p = "lower")$lower_p_value, p_lower)
  expect_equal(summary(ri2_out, p = "upper")$upper_p_value, p_upper)
  expect_equal(summary(ri2_out)$two_tailed_p_value, p_two_tailed)
})
