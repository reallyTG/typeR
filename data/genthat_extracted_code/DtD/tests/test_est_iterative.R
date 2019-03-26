context("Testing iterative method")

test_that("iterative method gives previous output without supplying a starting value for the vol", {
  set.seed(79156879)
  sims <- BS_sim(
    vol = .2, mu = .01, dt = .1, V_0 = 100, T. = 1,
    D = runif(25, 80, 100), r = runif(25, -.01, .01))

  with(sims,
    expect_equal(
      BS_fit(S = S, D = D, T. = T, r = r, time = time),
      structure(list(
        ests = structure(c(0.128950682053545, 0.206531228321864),
                         .Names = c("mu", "vol")),
        n_iter = 12L, success = TRUE),
        .Names = c("ests", "n_iter", "success"))))
})

test_that("iterative method gives previous output when supplying a starting value for the vol", {
  set.seed(79156879)
  sims <- BS_sim(
    vol = .2, mu = .01, dt = .1, V_0 = 100, T. = 1,
    D = runif(25, 80, 100), r = runif(25, -.01, .01))

  with(sims,
       expect_equal(
         BS_fit(S = S, D = D, T. = T, r = r, time = time, vol_start = 1),
         structure(list(
           ests = structure(c(0.128950682053545, 0.206531228321864),
                            .Names = c("mu", "vol")),
           n_iter = 15L, success = TRUE),
           .Names = c("ests", "n_iter", "success"))))
})

test_that("supplying dt or time gives the same when it should", {
  set.seed(7915688)
  sims <- BS_sim(
    vol = .2, mu = .01, dt = .1, V_0 = 100, T. = 1,
    D = runif(25, 80, 100), r = runif(25, -.01, .01))

  with(sims,
       expect_equal(
         BS_fit(S = S, D = D, T. = T, r = r, time = time, vol_start = 1),
         BS_fit(S = S, D = D, T. = T, r = r, dt = .1, vol_start = 1)))
})
