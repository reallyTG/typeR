library(valuer)
context("penalty class tests")


test_that("penalty_class methods work", {

  expect_silent(penalty <- penalty_class$new(type = 1, const = 0.03, T = 10))

  expect_equal(penalty$get(), 0.03)

  expect_silent(penalty$set(0.04))

  expect_equal(penalty$get(10), 0.04)

  expect_silent(penalty <- penalty_class$new(type = 2, const = 0.08, T = 10))

  expect_equal(penalty$get(0), 0.08)
  expect_equal(penalty$get(10), 0)

  expect_silent(penalty$set(0.04))

  expect_equal(penalty$get(0), 0.04)

  expect_silent(penalty <- penalty_class$new(type = 3, const = 0.08, T = 5))

  expect_lt(penalty$get(0), 0.08)
  expect_equal(penalty$get(5), 0)

  expect_silent(penalty$set(0.04))

  expect_lt(penalty$get(0), 0.04)

})

test_that("GMAB with penalty_class works", {

  rollup <- payoff_rollup$new(premium = 100, constant_parameters$new(0.01))
  begin <- timeDate::timeDate("2016-01-01")
  end <- timeDate::timeDate("2020-12-31")
  age <- 60
  fee <- constant_parameters$new(0.02)
  penalty <- penalty_class$new(type = 2, const = 0.04, T = 5)
  contract <- GMAB$new(rollup, t0 = begin, t = end, age = age,  fee = fee, penalty = penalty)

  expect_is(contract$get_penalty_object(), "penalty_class")
  expect_length(contract$get_penalty(), length(contract$get_times()) + 1)

  engine <- va_bs_engine$new(contract, constant_parameters$new(0.03), c1=90.43, c2=10.36,
                             spot = 100,
                             volatility=constant_parameters$new(0.2),
                             dividends= constant_parameters$new(0.0))
  engine$simulate_financial_paths(1)
  y <- engine$get_fund(1)

  expect_length(contract$cash_flows(y, engine$death_time()), length(y))
  expect_gt(contract$survival_benefit(y, 5000, length(contract$get_times())), 0)

})
