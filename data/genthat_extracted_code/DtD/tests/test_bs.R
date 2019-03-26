context("Testing bs function")

BS_call_R <- function(V, D, T., r, sd.){
  d = (log(V) - log(D) + (r + sd.^2/2) * T.) / (sd. * sqrt(T.))

  pnorm(d) * V - pnorm(d - sd. * sqrt(T.)) * D * exp(-r * T.)
}

test_that("cpp call function gives the correct price", {
  vals <- expand.grid(
    V = c(50, 100, 150), D = c(50, 100, 150), T. = c(.1, 1, 2),
    r = c(-.1, 0, .1), sd = c(.01, .1, .5))

  for(i in 1:nrow(vals))
    eval(substitute(
      expect_equal(BS_call  (V, D, T., r, sd),
                   BS_call_R(V, D, T., r, sd)),
      vals[i, ]))
})

# microbenchmark::microbenchmark(
#   BS_call(100, 90, 1, .1, .3), BS_call_R(100, 90, 1, .1, .3))

test_that("mapply and vectorized version gives the same", {
  vals <- expand.grid(
    V = c(50, 100, 150), D = c(50, 100, 150), T. = c(.1, 1, 2),
    r = c(-.1, 0, .1), sd = c(.01, .1, .5))

  with(
    vals, expect_equal(
      BS_call(V, D, T., r, sd),
      mapply(BS_call, V, D, T., r, sd)))
})

test_that("cpp inversion method works", {
  vals <- expand.grid(
    V = c(90, 100, 110), D = c(90, 100, 110), T. = c(.5, 1, 2),
    r = c(-.1, 0, .1), sd = c(.1, .1, .5))

  for(i in 1:nrow(vals))
    eval(substitute(
      expect_equal(
        V,
        get_underlying(BS_call(V, D, T., r, sd),
                       D, T., r, sd)),
      vals[i, ]))
})

# microbenchmark::microbenchmark(
#   get_underlying(25, 100, 1, .01, .3), times = 1e5)
# profvis::profvis(replicate(1e5, get_underlying(25, 100, 1, .01, .3)))

test_that("mapply and vectorized version gives the same with inversion", {
  set.seed(81460086)
  sims <- BS_sim(
    vol = .1, mu = .05, dt = .1, V_0 = 100, T. = 1,
    D = runif(10, 80, 100), r = runif(10, -.01, .01))

  with(sims,
    expect_equal(
      mapply(get_underlying, S, D, T = T, r, vol),
      get_underlying(S, D, T, r, vol)))
})

# microbenchmark::microbenchmark(
#   mapply(get_underlying, S, D, T = 1, r, vol),
#   get_underlying(S, D, 1, r, vol), times = 1e4)
# profvis::profvis(replicate(1e3, get_underlying(S, D, 1, r, vol)))
