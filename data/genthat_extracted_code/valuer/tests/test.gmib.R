library(valuer)
context("GMIB tests")


test_that("GMIB methods work", {
  rollup <- payoff_rollup$new(premium = 100, constant_parameters$new(0.01))
  t0 <- timeDate::timeDate("2016-01-01")
  t <- timeDate::timeDate("2020-12-31")
  t1 <- timeDate::timeDate("2025-12-31")
  age <- 60
  fee <- constant_parameters$new(0.02)
  penalty <- penalty_class$new(type = 1, 0.01)
  barrier <- 200

  set.seed(1)

  #GMIB life annuity

  expect_is(GMIB$new(rollup, t0 = t0, t = t, age = age, fee =fee,
                     barrier = barrier, penalty = penalty), "GMIB")

  contract <- GMIB$new(rollup, t0 = t0, t = t, age = age, fee =fee,
                       barrier = barrier, penalty = penalty)

  expect_equal(tail(contract$times_in_yrs(), 1), 60)

  engine <- va_bs_engine$new(contract, constant_parameters$new(0.03), c1=90.43, c2=10.36,
                             spot = 100,
                             volatility=constant_parameters$new(0.2),
                             dividends= constant_parameters$new(0.0))

  engine$simulate_financial_paths(1)
  y <- engine$get_fund(1)

  #expects 20 potential surrender times in 5 years if
  #the surrender decision is taken every 3 months

  expect_length(contract$surrender_times(), 19)

  #expects 56 potential life payments.
  expect_length(contract$survival_benefit_times(), 56)

  #expects no life payment (cash_flow is zero) after death.
  expect_equal(min(which(contract$cash_flows(y, 1500) == 0)), 1501)

  #expects 56 life payments if death doesn't occur before max age.
  expect_equal(sum(contract$cash_flows(y, 21900)[1827:21900] != 0), 56)

  #expects survival benefits is payed at the end of the
  #accumalation period if the insured is alive.
  expect_equal(contract$survival_benefit(y, 1828, 1827), contract$cash_flows(y, 21900)[1827])

  #expects 2 living payments if death happens at time index 2300
  expect_equal(sum(contract$cash_flows(y, 2300)[1827:21900] != 0), 2)

  #expects pricing with mixed method works
  gatherer <- mc_gatherer$new()

  expect_silent(engine$do_mixed(gatherer, 10))


  #GMIB annuity certain up to t1 (t1 == 10 years)

  expect_is(GMIB$new(rollup, t0 = t0, t = t, t1 = t1, age = age, fee =fee,
                     barrier = barrier, penalty = penalty, type="Ib"), "GMIB")

  contract <- GMIB$new(rollup, t0 = t0, t = t, t1 = t1, age = age, fee =fee,
                       barrier = barrier, penalty = penalty, type="Ib")

  engine <- va_bs_engine$new(contract, constant_parameters$new(0.03), c1=90.43, c2=10.36,
                             spot = 100,
                             volatility=constant_parameters$new(0.2),
                             dividends= constant_parameters$new(0.0))


  #expects the contract expires in 10 years

  expect_equal(tail(contract$times_in_yrs(), 1), 10)

  #expects 20 potential surrender times in 5 years if
  #the surrender decision is taken every 3 months

  expect_length(contract$surrender_times(), 19)

  #expects 6 potential life payments from 5 to 10 years.
  expect_length(contract$survival_benefit_times(), 6)


  #expects pricing with mixed method works
  gatherer <- mc_gatherer$new()

  expect_silent(engine$do_mixed(gatherer, 10))



  #GMIB annuity certain + life annuity

  expect_is(GMIB$new(rollup, t0 = t0, t = t, t1 = t1, age = age, fee =fee,
                     barrier = barrier, penalty = penalty, type="Ic"), "GMIB")


  contract <- GMIB$new(rollup, t0 = t0, t = t, t1 = t1, age = age, fee =fee,
                       barrier = barrier, penalty = penalty, type="Ic")

  #expects it's a life annuity (up to maxage = 120 years!)
  expect_equal(tail(contract$times_in_yrs(), 1), 60)

  #expects 20 potential surrender times in 5 years if
  #the surrender decision is taken every 3 months

  expect_length(contract$surrender_times(), 19)

  #expects 56 potential life payments from 65 to 120 years
  expect_length(contract$survival_benefit_times(), 56)

  #Expects a death benefit at death time if death is before 10 years
  expect_true(contract$cash_flows(y, 2300, engine$get_discount())[2300] > 0)

  #expects no death benefit if the death time is after 10 years.
  expect_true(contract$cash_flows(y, 4000, engine$get_discount())[4000] == 0)



})
