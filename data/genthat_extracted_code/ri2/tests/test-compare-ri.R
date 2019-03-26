context("Compare to ri")


test_that("Compare to ri", {

  # setup -------------------------------------------------------------------

  y <- c(8, 6, 2, 0, 3, 1, 1, 1, 2, 2, 0, 1, 0, 2, 2, 4, 1, 1)
  Z <- c(1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0)
  cluster <- c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9)
  block <- c(rep(1, 4), rep(2, 6), rep(3, 8))

  # in ri -------------------------------------------------------------------
  library(ri)

  perms <-
    genperms(Z, blockvar = block, clustvar = cluster)

  probs <-
    genprobexact(Z, blockvar = block, clustvar = cluster)

  ate <- estate(y, Z, prob = probs)

  Ys <-
    genouts(y, Z, ate = 0)

  distout <-
    gendist(Ys, perms, prob = probs)

  ri1_out <- dispdist(distout, ate, display.plot = FALSE)

  # in ri2 ------------------------------------------------------------------

  library(ri2)

  declaration <- declare_ra(
    blocks = block,
    clusters = cluster,
    block_m = tapply(Z, block, sum) / 2
  )

  ri2_out <- conduct_ri(
    y ~ Z,
    sharp_hypothesis = 0,
    declaration = declaration,
    data = data.frame(y, Z)
  )

  # checks
  expect_equal(probs, declaration$probabilities_matrix[, 2])

  expect_equal(sort(distout), sort(ri2_out$sims_df$est_sim))

  expect_equal(
    summary(ri2_out, p = "two-tailed")$two_tailed_p_value,
    ri1_out$two.tailed.p.value.abs
  )

  expect_equal(
    summary(ri2_out, p = "lower")$lower_p_value,
    ri1_out$lesser.p.value
  )

  expect_equal(
    summary(ri2_out, p = "upper")$upper_p_value,
    ri1_out$greater.p.value
  )

  expect_equivalent(
    quantile(ri2_out$sims_df$est_sim, probs = 0.025),
    ri1_out$quantile[1]
  )
  expect_equivalent(
    quantile(ri2_out$sims_df$est_sim, probs = 0.975),
    ri1_out$quantile[2]
  )
})
