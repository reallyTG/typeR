# ######################################################### Test EulerRichardson
# Euler-Richardson class does not implement getState() and getRate()
# as in the case of Euler
#
#########################
library(testthat)

context("test EulerRichardson")

state <- c(0, 1, 3)
rate  <- c(0, 0, 0)
stepSize <- 0.1

ode <- new("ODE")

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ test constructor

# expect_error(EulerRichardson(), 'argument ".ode" is missing, with no default')

eulerRichardson <- EulerRichardson(ode)

eulerRichardson@ode@state <-  state                # set a vector for state

test_that("EulerRichardson instance is OK", {
    # ----------------------------------------- these two vars hold no values
    expect_true(length(ode@state) == 0)
    expect_true(length(ode@rate)  == 0)

    #                                                  values stored here in ode
    expect_true(all(eulerRichardson@ode@state == state))
    expect_true(length(eulerRichardson@ode@rate) == 0)
})

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ test init()
eulerRichardson <- init(eulerRichardson, stepSize)

test_that("EulerRichardson init works fine", {

    expect_equal(eulerRichardson@stepSize, stepSize)      # test stepSize

    expect_equal(eulerRichardson@ode@state, state)
    expect_equal(eulerRichardson@numEqn, 3)               # number of equations

    expect_true(!is.null(step(eulerRichardson)))    # step returns a value not NULL

    expect_true(length(ode@rate)  == 0)                     # rate still empty
    expect_equal(getRate(eulerRichardson@ode), c(0, 0, 0))  # rate has a vector

    # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ test step()
    #                                rate is zero until we run setState and getRate
    expect_equal(eulerRichardson@midstate, c(0, 0, 0))  # midpoint before step

})

test_that("EulerRichardson step work", {
    eulerRichardson <- step(eulerRichardson)
    expect_equal(eulerRichardson@ode@state, state)
    expect_equal(eulerRichardson@ode@rate, rate)
    expect_equal(eulerRichardson@midstate, state)       # midpoint after step

    eulerRichardson <- step(eulerRichardson)
    expect_equal(eulerRichardson@ode@state, state)
    expect_equal(eulerRichardson@ode@rate, rate)
    expect_equal(eulerRichardson@midstate, state)       # midpoint after step

    eulerRichardson <- step(eulerRichardson)
    expect_equal(eulerRichardson@ode@state, state)
    expect_equal(eulerRichardson@ode@rate, rate)
    expect_equal(eulerRichardson@midstate, state)       # midpoint after step

    eulerRichardson <- step(eulerRichardson)
    expect_equal(eulerRichardson@ode@state, state)
    expect_equal(eulerRichardson@ode@rate, rate)
    expect_equal(eulerRichardson@midstate, state)       # midpoint after step
})

