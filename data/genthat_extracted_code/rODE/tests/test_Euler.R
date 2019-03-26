library(testthat)

context("test Euler")

# source("./R/ode_generics.R")
# source("./R/Euler.R")


ode <- new("ODE")


test_that("No ODE parameter supplied", {
    expect_warning(Euler(), 'No ODE supplied. Using an empty one!')
})


euler <- Euler(ode)

test_that("Class is Euler", {
    expect_true(class(euler) == "Euler")
})

test_that("Have correct slot names", {
    expect_equal(slotNames(euler), c("stepSize", "numEqn", "ode"))
    expect_equal(slotNames(euler@ode), c("state", "rate"))
})

state <- c(0, 1, 3)

euler@ode@state <-  c(0, 1, 3)             # set a vector for state

test_that("getStepSize has the expected value", {
    expect_equal(getStepSize(euler), 0.1)        # get default step size
})
test_that("state and rate hold no values", {
# ----------------------------------------- these two vars hold no values
    expect_true(length(ode@state) == 0)
    expect_true(length(ode@rate)  == 0)
})

test_that("state and rate are store in ode slot", {
# +++++++++++++++++++++++++++++++++++++++++ values stored here
    expect_true(all(euler@ode@state == state))
    expect_true(length(euler@ode@rate) == 0)
})


euler <- init(euler, 0.123)

test_that("EUler initializes OK", {
    expect_equal(euler@ode@state, state)
    expect_equal(euler@numEqn, 3)
})

euler <- setStepSize(euler, 0.1010)     # set a new step size

test_that("step size is correct", {
    expect_equal(getStepSize(euler), 0.1010)
})
# step(euler)

test_that("values correct after init", {
    expect_true(!is.null(step(euler)))        # step from Euler returns a value
    expect_equal(euler@ode@state, c(0, 1, 3))
    expect_equal(euler@ode@rate, c(0, 0, 0))
    # expect_equal(getRate(euler@ode), c(0, 0, 0))
})

# rate remains zero until we do setState and getRate at inherited class
euler <- step(euler)
test_that("values correct after step", {
    expect_true(!is.null(step(euler)))        # step from Euler returns a value
    expect_equal(euler@ode@state, c(0, 1, 3))
    expect_equal(euler@ode@rate, c(0, 0, 0))
    expect_equal(getRate(euler@ode), c(0, 0, 0))
})

# setMethod("step", "Projectile", function(object) {
    euler <- step(euler)

    rate  <- euler@ode@rate
    state <- euler@ode@state

# setMethod("setState", "Projectile", function(object, x, vx, y, vy) {
x <- 0; vx <- 10; y <- 0; vy <- 10



