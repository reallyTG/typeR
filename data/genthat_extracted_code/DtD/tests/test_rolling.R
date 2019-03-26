context("Testing rolling")

test_that("min width argument gives the correct result", {
  set.seed(55770945)
  n <- 21L * 3L * 12L
  sims <- BS_sim(
    vol = .1, mu = .05, dt = .1, V_0 = 100, T. = 1,
    D = runif(n, 80, 90), r = runif(n, 0, .01))
  sims$month <- (1:nrow(sims) - 1L) %/% 21L + 1L

  # throw out some months
  sims <- subset(sims, !month %in% 15:24)

  grp <- sims$month
  width <- 12L
  min_obs <- 21L * 3L
  grps <- unique(grp)

  for(m in c("iterative", "mle")){
    out <- matrix(
      NA_real_, nrow = length(grps), ncol = 6,
      dimnames = list(NULL, c("mu", "vol", "n_iter", "success", "n_obs", "grp")))
    for(g in grps){
      idx <- which(grps == g)
      keep <- which(grp %in% (g - width + 1L):g)
      out[idx, c("n_obs", "grp")] <- c(length(keep), g)
      if(length(keep) < min_obs)
        next
      res <- with(
        sims[keep, ],
        BS_fit(S = S, D = D, T. = T, r = r, time = time, method = m,
               vol_start = 1))
      out[idx, c("mu", "vol", "n_iter", "success")] <- rep(
        do.call(c, res[c("ests", "n_iter", "success")]), each = length(idx))
    }

    out_func <- with(sims, BS_fit_rolling(
      S = S, D = D, T. = T, r = r, time = time, method = m,
      grp = month, width = width, min_obs = min_obs))

    expect_equal(out[, names(out) != "n_iter"],
                 out_func[, names(out_func) != "n_iter"],
                 info = sQuote(m))
  }
})


test_that("approiate result is given with extreme values", {
  set.seed(55770945)
  n <- 20L * 2L
  sims <- BS_sim(
    vol = .1, mu = .05, dt = .1, V_0 = 100, T. = 1,
    D = runif(n, 80, 90), r = runif(n, 0, .01))
  sims$grp <- (1:nrow(sims) - 1L) %/% 2L + 1L

  extreme <- 36L
  sims$D[extreme] <- 1e9

  out_func <- with(sims, BS_fit_rolling(
    S = S, D = D, T. = T, r = r, time = time, method = "iterative",
    grp = grp, width = 20L, min_obs = 20L))
  expect_true(all(
    out_func[as.integer(extreme / 2L):nrow(out_func), "success"] == 0))
  expect_true(all(is.na(
    out_func[as.integer(extreme / 2L):nrow(out_func), c("mu", "vol")] == 0)))

  expect_equal(sapply(attr(out_func, "errors"), "[[", "grp"), 18:20)
})
