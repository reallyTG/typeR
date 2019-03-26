context("f_tests")


test_that("main effect f test", {
  N <- 100
  declaration <- randomizr::declare_ra(N = N, m = 50)

  Z <- randomizr::conduct_ra(declaration)
  X <- rnorm(N)
  Y <- .9 * X + .2 * Z + rnorm(N)
  df <- data.frame(Y, X, Z)


  ri_out <-
    conduct_ri(
      model_1 = Y ~ 1,
      model_2 = Y ~ Z,
      declaration = declaration,
      assignment = "Z",
      sharp_hypothesis = 0,
      data = df, sims = 100
    )

  plot(ri_out)
  summary(ri_out)
  anova(lm(Y ~ Z, data = df))
  expect_true(TRUE)
})



test_that("interaction test under constant fx", {
  N <- 100
  declaration <- randomizr::declare_ra(N = N, m = 50)

  Z <- randomizr::conduct_ra(declaration)
  X <- rnorm(N)
  Y <- .9 * X + .2 * Z + 1 * X * Z + rnorm(N)
  df <- data.frame(Y, X, Z)

  ate_obs <- coef(lm(Y ~ Z, data = df))[2]

  ri_out <-
    conduct_ri(
      model_1 = Y ~ Z + X,
      model_2 = Y ~ Z + X + Z * X,
      declaration = declaration,
      assignment = "Z",
      sharp_hypothesis = ate_obs,
      data = df, sims = 100
    )

  plot(ri_out)
  summary(ri_out)
  anova(
    lm(Y ~ Z + X, data = df),
    lm(Y ~ Z + X + Z * X, data = df)
  )
  expect_true(TRUE)

})



test_that("Balance Test", {
  # need to think on this one

  # N <- 100
  # declaration <- randomizr::declare_ra(N = N, m = 50)
  #
  # Z <- randomizr::conduct_ra(declaration)
  # X1 <- rnorm(N)
  # X2 <- rnorm(N)
  # df <- data.frame(X1, X2, Z)
  #
  # debugonce(conduct_ri)
  # ri_out <-
  #   conduct_ri(
  #     model_1 = Z ~ 1,
  #     model_2 = Z ~ X1 + X2,
  #     declaration = declaration,
  #     assignment = "Z",
  #     sharp_hypothesis = 0,
  #     data = df
  #   )
  #
  # plot(ri_out)
  # summary(ri_out)
  # anova(lm(Y ~ Z + X, data = df),
  #       lm(Y ~ Z + X + Z*X, data = df))
  expect_true(TRUE)
})
