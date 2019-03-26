library(testthat)
context("test AbstractODESolver")

# test_that("there are no constructor for ODE", {
#     expect_error(ode <- ODE(), 'could not find function "ODE"')
# })

test_that("Constructor needs ODE parameter", {
    expect_warning(AbstractODESolver(), 'No ODE supplied. Using an empty one!')
})


test_that("Class is correct", {
    ode <- new("ODE")
    odesolver <- AbstractODESolver(ode)
    expect_true(class(odesolver) == "AbstractODESolver")
})


test_that("Have correct slot names", {
    ode <- new("ODE")
    odesolver <- AbstractODESolver(ode)
    expect_equal(slotNames(odesolver), c("stepSize", "numEqn", "ode"))
    expect_equal(slotNames(odesolver@ode), c("state", "rate"))
})


# test_that("Get the default step size", {
    ode <- new("ODE")
    odesolver <- AbstractODESolver(ode)
    state <- c(0, 1, 3)
    odesolver@ode@state <-  c(0, 1, 3)             # set a vector for state
    expect_equal(getStepSize(odesolver), 0.1)        # get default step size
# })


test_that("ODE object are zero", {
    ode <- new("ODE")
    # ----------------------------------------- these two vars hold no values
    expect_true(length(ode@state) == 0)
    expect_true(length(ode@rate)  == 0)
})


test_that("slots in AbstractODESolver have these values", {
    ode <- new("ODE")
    odesolver <- AbstractODESolver(ode)
    state <- c(0, 1, 3)
    # +++++++++++++++++++++++++++++++++++++++++ values stored here
    expect_true(all(odesolver@ode@state == state))
    expect_true(length(odesolver@ode@rate) == 0)
})


test_that("Can set and get step size", {
    ode <- new("ODE")
    odesolver <- AbstractODESolver(ode)
    odesolver <- setStepSize(odesolver, 0.1010)     # set a new step size
    expect_equal(getStepSize(odesolver), 0.1010)
})


test_that("values set after init", {
    ode <- new("ODE")
    odesolver <- AbstractODESolver(ode)
    state <- c(0, 1, 3)
    odesolver@ode@state <-  c(0, 1, 3)             # set a vector for state
    odesolver <- init(odesolver, 0.123)
    expect_equal(odesolver@ode@state, state)       # state should have a vector
    expect_true(length(odesolver@ode@rate) == 0)   # rate has no vector
    expect_equal(odesolver@numEqn, 3)              # numEqn should be 3
})


test_that("step", {
    ode <- new("ODE")
    odesolver <- AbstractODESolver(ode)
    state <- c(0, 1, 3)
    odesolver@ode@state <-  c(0, 1, 3)             # set a vector for state
    odesolver <- init(odesolver, 0.123)

    # expect_true(is.null(step(odesolver)))           # step from odesolver NULL
    # print(step(odesolver))
    class(step(odesolver)) == "AbstractODESolver"
})
