context('preference function calls')

#############################
### Sample Size Functions ###
#############################

# Private functions

test_that("overall_sample_size function works", {
  resp <- overall_sample_size(power=0.8, phi=c(0.5,0.4), sigma2=c(1, 1), 
    delta_pi=1, delta_nu=0.5, delta_tau=1.5, xi=c(0.3,0.7),nstrata=2)
  expect_equal(resp$treatment, 28)
  expect_equal(resp$selection, 596)
  expect_equal(resp$preference, 138)
  expect_is(resp, 'data.frame')
})

# Public functions

test_that("Unstratified single trial", {
  trial <- preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=1, pref_prop=0.6)
  expect_is(trial, "preference.trial")
  expect_is(trial, "data.frame")
})

test_that("Pref sample size checking works", {
  expect_error(preference.trial(pref_ss=-100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=1, pref_prop=0.6))
})

test_that("Selection sample size checking works", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=-100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=1, pref_prop=0.6))
})

test_that("Treatment sample size checking works", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=-100, treatment_effect=1,
    sigma2=1, pref_prop=0.6))
})

test_that("Preference effect size checking works", {
  preference.trial(pref_ss=100, pref_effect=-1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=1, pref_prop=0.6)
})

test_that("Treatment effect size checking works", {
  preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=-1,
    sigma2=1, pref_prop=0.6)
})

test_that("Selection effect size checking works", {
  preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=-1, treatment_ss=100, treatment_effect=1,
    sigma2=1, pref_prop=0.6)
})

test_that("Alpha checking works", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=1, pref_prop=0.6, alpha = 300))
})

test_that("Stratified single trial", {
  trial <- preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
    choice_prop=0.5, stratum_prop=list(c(0.3, 0.7)))

  expect_is(trial, "preference.trial")
  expect_is(trial, "data.frame")
})

test_that("Multiple trials unstratified", {
  trial <- preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
    choice_prop=0.5, stratum_prop=list(c(0.3, 0.7)))

  expect_is(trial, "preference.trial")
  expect_is(trial, "data.frame")
})

test_that("Multiple trials error checking 1", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
    choice_prop=0.5, stratum_prop=list(c(0.7, 0.1, 0.2))))
})

test_that("Multiple trials error checking 2", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
    choice_prop=0.5, stratum_prop=list(c(-0.7, 14))))
})

test_that("Multiple trials error checking 3", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
    choice_prop=0.5, stratum_prop=list(c(-0.7, 1.7))))
})

test_that("Multiple trials error checking 4", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(0.2, 0.8)), pref_prop=list(c(0.6, 0.3)),
    choice_prop=-0.5, stratum_prop=list(c(0.7, 0.3))))
})

test_that("Multiple trials error checking 5", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(0.2, 0.8)), pref_prop=list(c(1.6, -0.6)),
    choice_prop=0.5, stratum_prop=list(c(0.7, 0.3))))
})

test_that("Multiple trials error checking 6", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c("a", "b")), pref_prop=list(c(0.6, 0.4)),
    choice_prop=0.5, stratum_prop=list(c(0.7, 0.3))))
})

test_that("Multiple trials error checking 7", {
  expect_error(preference.trial(pref_ss=100, pref_effect=1, selection_ss=100,
    selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(0.1)), pref_prop=list(c(1.6, -0.6)),
    choice_prop=0.5, stratum_prop=list(c(0.7, 0.3))))
})

test_that("Multiple trials stratified", {
  trial <- preference.trial(pref_ss=100, pref_effect=seq(0.1, 2, by=0.5),
    selection_ss=100, selection_effect=1, treatment_ss=100, treatment_effect=1,
    sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
    choice_prop=0.5, stratum_prop=list(c(0.3, 0.7)))

  expect_is(trial, "preference.trial")
  expect_is(trial, "data.frame")
})

test_that("Circular indexing warning.", {
  expect_warning(preference.trial(pref_ss=100, pref_effect=seq(0.1, 2, by=0.5),
    selection_ss=100:102, selection_effect=1, 
    treatment_ss=100, treatment_effect=1,
    sigma2=list(c(1, 0.8)), pref_prop=list(c(0.6, 0.3)),
    choice_prop=0.5, stratum_prop=list(c(0.3, 0.7))))
})

test_that("pt_from_power ", {
  trial <- pt_from_power(power=seq(0.1, 0.8, by=0.1), pref_effect=1,
    selection_effect=1, treatment_effect=1,
    sigma2=c(1, 0.8), pref_prop=c(0.6, 0.3),
    choice_prop=0.5, stratum_prop=c(0.3, 0.7))
  expect_is(trial, "preference.trial")
  expect_is(trial, "data.frame")
})

test_that("pt_from_power fail", {
  expect_error(pt_from_power(power=letters, pref_effect=1,
    selection_effect=1, treatment_effect=1,
    sigma2=c(1, 0.8), pref_prop=c(0.6, 0.3),
    choice_prop=0.5, stratum_prop=c(0.3, 0.7)))
})

test_that("pt_from_ss", {
  trial <- pt_from_ss(ss=seq(100, 1000, by=100), pref_effect=1,
    selection_effect=1, treatment_effect=1,
    sigma2=c(1, 0.8), pref_prop=c(0.6, 0.3),
    choice_prop=0.5, stratum_prop=c(0.3, 0.7))
  expect_is(trial, "preference.trial")
  expect_is(trial, "data.frame")
})

test_that("pt_from_ss fail", {
  expect_error(pt_from_ss(sample_size=letters, pref_effect=1,
    selection_effect=1, treatment_effect=1,
    sigma2=c(1, 0.8), pref_prop=c(0.6, 0.3),
    choice_prop=0.5, stratum_prop=c(0.3, 0.7)))
})

#######################
### Power Functions ###
#######################

test_that("overall_power function works", {
  resp <- overall_power(N=300, phi=c(0.6,0.5), sigma2=c(1,1), delta_pi=1, 
                    delta_nu=0.5, delta_tau=0.5, xi=c(0.5,0.5), nstrata=2)
  expect_equal(round(resp$treatment,6), 0.864747)
  expect_equal(round(resp$preference,6), 0.984880)
  expect_equal(round(resp$selection,6), 0.508326)
  expect_is(resp, 'data.frame')
})

##########################
### Analysis Functions ###
##########################

#test_that("analyze_summary_data function works", {
#  x1mean <- 5
#  x1var <- 1
#  m1 <- 15
#  x2mean <- 7
#  x2var <- 1.1
#  m2 <- 35
#  y1mean <- 6
#  y1var <- 1
#  n1 <- 25
#  y2mean <- 8
#  y2var <- 1.2
#  n2 <- 25
#  resp <- analyze_summary_data(x1mean, x2var, m1, x2mean, x2var, m2, y1mean, 
#    y2var, n1, y2mean, y2var, n2)
#  expect_equal(round(resp$pref_test,6), -4.461299)
#  expect_equal(round(resp$sel_test,6), 1.544837)
#  expect_equal(round(resp$treat_test,6), -6.454972)
#  expect_is(resp, 'data.frame')
#})

#######################
### Other Functions ###
#######################

test_that("treatment_effect_size function works", {
  resp <- treatment_effect_size(N=300, power=0.9, sigma2=c(1,0.8), 
    xi=c(0.3,0.7), nstrata=2)
  expect_equal(round(resp,6), 0.490887)
  expect_is(resp, 'numeric')
})

test_that("optimal_proportion function works", {
  resp <- optimal_proportion(w_sel=0.2, w_pref=0.4, w_treat=0.4, sigma2=1, 
    phi=0.5, delta_pi=1, delta_nu=0.5)
  expect_equal(round(resp,6), 0.451026)
  expect_is(resp, 'numeric')
})

test_that("effects_from_means function works", {
  resp <- effects_from_means(mu1=1, mu2=2, mu11=1.5, mu22=2.5, phi=0.5)
  expect_equal(resp$treatment, -1)
  expect_equal(resp$selection, 0)
  expect_equal(resp$preference, 1)
  expect_is(resp, 'list')
})

test_that("preference stratified and unstratified aren't the same", {
  outcome <- c(10, 8, 6, 10, 5, 8, 7, 6, 10, 12, 11, 6, 8, 10, 5, 7, 9, 12, 6,
  8, 9, 10, 7, 8, 11)
  arm <- c(rep("choice", 13), rep("random", 12))
  treatment <- c(rep(1, 5), rep(2, 8), rep(1, 6), rep(2, 6))
  d <- data.frame(outcome = outcome, treatment = treatment, arm = arm)
  unstrat_pref <- preference(outcome ~ treatment:arm, d)

  strata <- c(1, 1, 2, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1,
              1, 2, 2, 2)
  d <- data.frame(outcome = outcome, treatment = treatment, arm = arm,
                  strata = strata)
  strat_pref <- preference(outcome ~ treatment:arm|strata, d, alpha=0.1)

  expect_false(
    all(strat_pref$overall_statistics == unstrat_pref$overall_statistics))

})
