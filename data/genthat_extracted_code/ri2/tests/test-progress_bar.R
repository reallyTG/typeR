context("Two Arm Trial")


test_that("Basic Two Arm Trial", {
  N <- 100
  declaration <- randomizr::declare_ra(N = N, m = 50)

  Z <- randomizr::conduct_ra(declaration)
  X <- rnorm(N)
  Y <- .9 * X + .2 * Z + rnorm(N)
  W <- runif(N)
  df <- data.frame(Y, X, Z, W)


  ri_out <-
    conduct_ri(
      formula = Y ~ Z,
      declaration = declaration,
      assignment = "Z",
      sharp_hypothesis = 0,
      data = df, sims = 100,
      progress_bar = TRUE
    )

  expect_true(TRUE)
})
