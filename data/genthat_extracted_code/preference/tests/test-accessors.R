context('preference accessor functions')

trials <- preference.trial(pref_ss=100, pref_effect=seq(0.1, 2, by=0.5),
                           selection_ss=100, selection_effect=1,
                           treatment_ss=100, treatment_effect=1, sigma2=1,
                           pref_prop=0.6)


test_that("The preference.trial object has been created correctly.", {
  expect_is(trials, "preference.trial")
  expect_is(trials, "data.frame")
  expect_equal(nrow(trials), 4)
  expect_equal(ncol(trials), 15)
})

test_that("The sample_size() function works", {
  df <- data.frame(pref_ss = rep(100, 4), selection_ss = rep(100, 4), 
                   treatment_ss = rep(100, 4))
  expect_equal(sample_size(trials), df)
})

test_that("The power() function works.", {
  df <- data.frame(
    pref_power=c(0.0413120, 0.2646798, 0.6741545, 0.9336748
                 ),
    selection_power=c(0.6568600, 0.6299353, 0.5833241, 
                      0.5247430),
    treatment_power=c(0.9424375, 0.9424375, 0.9424375, 
                      0.9424375))
    pt <- power(trials)
  expect_true(max(c(abs(pt$pref_power - df$pref_power), 
                     abs(pt$selection_power - df$selection_power),
                     abs(pt$treatment_power - df$treatment_power))) < 1e-7)
})

test_that("The effect_size() function works.", {
  df <- data.frame(pref_effect = c(0.1, 0.6, 1.1, 1.6), 
                   selection_effect = rep(1, 4), 
                   treatment_effect= rep(1, 4))
  expect_equal(effect_size(trials), df)
})

test_that("The proportion() function works.", {
  df <- data.frame(choice_prop = rep(0.5, 4))
  df$pref_prop <- list(0.6)
  df$stratum_prop <- list(1)
  expect_equal(proportion(trials), 
               df[, c("pref_prop", "choice_prop", "stratum_prop")])
})

test_that("The significance() function works.", {
  expect_equal(significance(trials), rep(0.05, 4))
})

test_that("The sigma2() function works.", {
  expect_equal(sigma2(trials), as.list(rep(1, 4)))
})

