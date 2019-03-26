context("Testing simulation function")

test_that("Cliam in vignette about equal result holds", {
  # assign parameters
  vol <- .1
  mu  <- .05
  dt  <- .05
  V_0 <- 100
  t.  <- (1:50 - 1L) * dt
  D   <- c(rep(80, 27), rep( 70, length(t.) - 27))
  r   <- c(rep( 0, 13), rep(.02, length(t.) - 13))

  # simulate underlying
  set.seed(seed <- 83992673)
  V <- V_0 * exp(
    (mu - vol^2/2) * t. + cumsum(c(
      0, rnorm(length(t.) - 1, sd = vol * sqrt(dt)))))

  # compute stock price
  S <- mapply(BS_call, V, D, T = 1, r, vol)

  # with simulation function
  set.seed(seed) # use same seed
  sims <- BS_sim(vol = vol, mu = mu, dt = dt, V_0 = V_0, D = D, r = r, T. = 1)

  expect_equal(sims$V, V)
  expect_equal(sims$S, S)
})

test_that("Simulation function gives previous results", {
  set.seed(17194596)
  sims <- BS_sim(
    vol = .1, mu = .05, dt = .1, V_0 = 100, T. = 1,
    D = c(rep(80, 20), rep( 60, 20)),
    r = c(rep( 0, 10), rep(.01, 30)))

  expect_known_value(sims, "known_value/sims.RDS", update = FALSE)
})

test_that("We can get S and V from the simulated output", {
  set.seed(36646265)
  sims <- BS_sim(
    vol = .1, mu = .05, dt = .1, V_0 = 100, T. = 1,
    D = c(rep(80, 20), rep( 60, 20)),
    r = c(rep( 0, 10), rep(.01, 30)))

  with(sims, expect_equal(V, get_underlying(S, D, T, r, vol)))
  with(sims, expect_equal(S, BS_call(V, D, T, r, vol)))
})
