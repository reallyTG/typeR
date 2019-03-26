context('preference print function')

test_that("Plot trials with fixed power and varying preference effect.", {
  trials <- pt_from_power(power = 0.8, pref_effect = seq(0.5, 2, by = 0.1),
                          selection_effect = 1, treatment_effect = 1,
                          sigma2 = 1, pref_prop = 0.6)
  p <- plot(trials)
  expect_is(p, "gg")
  expect_is(p, "ggplot")
})

test_that("Plot trials with fixed power and varying selection effect.", {
  trials <- pt_from_power(power = 0.8, pref_effect = 1,
                          selection_effect = seq(0.5, 2, by = 0.1),
                          treatment_effect = 1, sigma2 = 1, pref_prop = 0.6)
  p <- plot(trials)
  expect_is(p, "gg")
  expect_is(p, "ggplot")
})

test_that("Plot trials with fixed power varying preference and selection.", {
  trials <- pt_from_power(power = 0.8, 
    pref_effect = rep(seq(0.4, 1, by = 0.2), each = 16),
    selection_effect = rep(seq(0.5, 2, by = 0.1), 4),
    treatment_effect = 1, sigma2 = 1, pref_prop = 0.6)
  p <- plot(trials)
  expect_is(p, "gg")
  expect_is(p, "ggplot")
})

