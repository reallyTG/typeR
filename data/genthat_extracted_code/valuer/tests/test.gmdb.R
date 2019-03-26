library(valuer)
context("GMDB tests")

test_that("GMDB methods work", {

  rollup <- payoff_rollup$new(premium = 100, constant_parameters$new(0.01))
  begin <- timeDate::timeDate("2016-01-01")
  end <- timeDate::timeDate("2020-12-31")
  age <- 60
  fee <- constant_parameters$new(0.008)
  penalty <- penalty_class$new(type = 1, const = 0.01)
  contract <- GMDB$new(rollup, t0 = begin, t = end, age = age,  fee = fee, penalty = penalty)

  engine <- va_bs_engine$new(contract, constant_parameters$new(0.03), c1=90.43, c2=10.36,
                             spot = 100,
                             volatility=constant_parameters$new(0.2),
                             dividends= constant_parameters$new(0.0))
  engine$simulate_financial_paths(10)
  y <- engine$get_fund(1)

  expect_equal(contract$survival_benefit_times(), length(y))
  expect_is(contract$cash_flows(y, engine$death_time()), "numeric")

  the_gatherer <- mc_gatherer$new()

  expect_silent(engine$do_static(the_gatherer, 10, simulate=FALSE))

  expect_silent(engine$do_mixed(the_gatherer, 10, simulate=FALSE))

  #SE error of the simulation should be greater than zero.
  expect_true(the_gatherer$get_results()[2] > 0)

})
