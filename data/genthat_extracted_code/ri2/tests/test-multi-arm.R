context("Multi Arm Trial")


test_that("Basic Multi Arm Trial", {
  N <- 100
  declaration <- randomizr::declare_ra(N = N, num_arms = 3)

  Z <- randomizr::conduct_ra(declaration)
  X <- rnorm(N)
  Y <- .9 * X + .5 * (Z == "T2") + rnorm(N)
  W <- runif(N)
  df <- data.frame(Y, X, Z, W)

  ri_out <-
    conduct_ri(
      formula = Y ~ Z,
      declaration = declaration,
      assignment = "Z",
      sharp_hypothesis = 0,
      data = df, sims = 50
    )

  ri_out
  summary(ri_out)
  plot(ri_out)

  summary(ri_out, p = "lower")
  plot(ri_out, p = "lower")

  summary(ri_out, p = "upper")
  plot(ri_out, p = "upper")

  expect_true(TRUE)
})
