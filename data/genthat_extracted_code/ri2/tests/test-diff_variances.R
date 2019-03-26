context("test-function")


test_that("test-function", {
  N <- 100
  declaration <- randomizr::declare_ra(N = N, m = 50)

  Z <- randomizr::conduct_ra(declaration)
  X <- rnorm(N)
  Y <- .9 * X + .2 * Z + rnorm(N)
  df <- data.frame(Y, X, Z)

  test_fun <- function(data) {
    with(data, var(Y[Z == 1]) - var(Y[Z == 0]))
  }

  ri_out <-
    conduct_ri(
      test_function = test_fun,
      declaration = declaration,
      assignment = "Z",
      sharp_hypothesis = 0,
      data = df, sims = 100
    )

  plot(ri_out)
  summary(ri_out)


  balance_fun <- function(data) {
    f_stat <- summary(lm(Z ~ X, data = data))$f[1]
    names(f_stat) <- NULL
    return(f_stat)
  }
  balance_fun(df)


  ri_out <-
    conduct_ri(
      test_function = balance_fun,
      declaration = declaration,
      assignment = "Z",
      sharp_hypothesis = 0,
      data = df, sims = 100
    )

  plot(ri_out)
  summary(ri_out)
  summary(lm(Z ~ X, data = df))

  expect_true(TRUE)
})
