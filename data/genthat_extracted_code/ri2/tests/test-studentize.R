context("Studentize")


test_that("Studentize", {
  N <- 100
  declaration <- randomizr::declare_ra(N = N, m = 50)

  Z <- randomizr::conduct_ra(declaration)
  X <- rnorm(N)
  Y <- .9 * X + .2 * Z + rnorm(N)
  W <- runif(N)
  df <- data.frame(Y, X, Z, W)


  # debugonce(ri2:::conduct_ri_ATE)
  ri_out <-
    conduct_ri(
      formula = Y ~ Z,
      declaration = declaration,
      assignment = "Z",
      sharp_hypothesis = 0,
      studentize = TRUE,
      data = df, sims = 100
    )

  plot(ri_out)
  summary(ri_out)

  ri_out <-
    conduct_ri(
      formula = Y ~ Z + X,
      declaration = declaration,
      assignment = "Z",
      sharp_hypothesis = 0,
      studentize = TRUE,
      data = df, sims = 100
    )

  plot(ri_out)
  summary(ri_out)
  expect_true(TRUE)
})
