context("nltt_diff_exact_norm_brts")


test_that("nltt_diff_exact_norm_brts: use", {

  if (1 == 2) {
    set.seed(42)
    p <- ape::rcoal(5)
    p$root.edge <- 0.1 # nolint ape variable name
    q <- ape::rcoal(5)
    p$root.edge <- 0.2 # nolint ape variable name
    nLTT::nLTTstat_exact(p, q, ignore_stem = FALSE)
    nLTT::nLTTstat_exact(p, q, ignore_stem = TRUE)
  }
  # High warning level
  options(warn = 2)

  if (2 == 3) {
    n <- 10
    b_times_n <- (seq(1, n) / n)
    lineages_n <- b_times_n
    b_times2_n <- b_times_n * b_times_n
    lineages2_n <- b_times2_n

    measured <- nLTT::nltt_diff_exact_norm_brts(
      b_times_n = b_times_n,
      lineages_n = lineages_n,
      b_times2_n = b_times2_n,
      lineages2_n = lineages2_n,
      distance_method = "abs"
    )
  }
})
