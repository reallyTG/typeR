# ######################################################### Test EulerRichardson
# Euler-Richardson class does not implement getState() and getRate()
# as in the case of Euler
#
#########################
library(testthat)
context("test RK4")

state <- c(0, 1, 3)
rate  <- c(0, 0, 0)
stepSize <- 0.1

ode <- new("ODE")

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ test constructor

# expect_error(RK4(), 'argument ".ode" is missing, with no default')

rk4 <- RK4(ode)

rk4@ode@state <-  state                # set a vector for state

test_that("state and rate hold no values", {
# ----------------------------------------- these two vars hold no values
    expect_true(length(ode@state) == 0)
    expect_true(length(ode@rate)  == 0)
})

test_that("state and rate values are stored in ODE", {
#                                                  values stored here in ode
    expect_true(all(rk4@ode@state == state))
    expect_true(length(rk4@ode@rate) == 0)
})

test_that("init() initializes class with proper values", {
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ test init()
    rk4 <- init(rk4, stepSize)

    expect_equal(rk4@stepSize, stepSize)      # test stepSize
    expect_equal(rk4@ode@state, state)
    expect_equal(rk4@numEqn, 3)               # number of equations
    expect_true(!is.null(step(rk4)))    # step returns a value not NULL
    expect_true(length(ode@rate)  == 0)                     # rate still empty
})


# expect_equal(getRate(rk4@ode), c(0, 0, 0))  # rate has a vector



test_that("all rates match after init", {
    rk4 <- init(rk4, stepSize)

    expect_equal(rk4@rate1, c(0, 0, 0))  # rate before step
    expect_equal(rk4@rate2, c(0, 0, 0))  # rate before step
    expect_equal(rk4@rate3, c(0, 0, 0))  # rate before step
    expect_equal(rk4@rate4, c(0, 0, 0))  # rate before step
})

