context("Two Arm Trial")


test_that("Basic Two Arm Trial", {
  N <- 100
  blocks <- rep(c("A", "B", "C"), c(10, 20, 70))
  block_m <- c(5, 5, 5)
  declaration <- randomizr::declare_ra(blocks = blocks, block_m = block_m)

  Z <- randomizr::conduct_ra(declaration)
  X <- rnorm(N)
  Y <- .9 * X + .2 * Z + rnorm(N)
  dat <- data.frame(Z, X, Y, blocks)

  ri_out <-
    conduct_ri(
      formula = Y ~ Z,
      declaration = declaration,
      sharp_hypothesis = 0,
      data = dat, sims = 10
    )

  summary(ri_out)
  dim <- difference_in_means(Y ~ Z, blocks = blocks, data = dat)

  expect_equivalent(summary(ri_out)$estimate, dim$coefficients)

  })
