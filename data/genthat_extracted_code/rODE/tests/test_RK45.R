# test_RK45.R
library(testthat)
context("test RK45")


setClass("ODETest", slots = c(
    n     = "numeric",           # counts the number of getRate evaluations
    stack = "environment"        # environnment to keep stack
    ),
    contains = c("ODE")
    )


setMethod("initialize", "ODETest", function(.Object, ...) {
    .Object@stack$rateCounts <-  0              # counter for rate calculations
    .Object@n <-  0
    .Object@state <- c(5.0, 0.0)
    return(.Object)
})


setMethod("getExactSolution", "ODETest", function(object, t, ...) {
    return(5.0 * exp(-t))
})


setMethod("getState", "ODETest", function(object, ...) {
    object@state
})

setMethod("getRate", "ODETest", function(object, state, ...) {
    object@rate[1] <- - state[1]
    object@rate[2] <-  1            # rate of change of time, dt/dt

    object@stack$rateCounts <- object@stack$rateCounts + 1

    object@state <- state
    object@rate
})


setMethod("getRateCounts", "ODETest", function(object, ...) {
    # use environment stack to accumulate rate counts
    object@stack$rateCounts
})

# constructor
ODETest <- function() {
    odetest <- new("ODETest")
    odetest
}




test_that("ODE solver core is OK", {
    ode = new("ODE")
    solver <- RK45(ode)
    expect_is(solver, "DormandPrince45")

    # check if slots match
    expect_equal(slotNames(solver),
    c("error_code",                 "a",                         "b5",
       "er",                        "numStages",                 "stepSize",
       "numEqn",                    "temp_state",                "k",
       "truncErr",                  "ode",                       "tol",
       "enableExceptions",          "NO_ERROR",                  "DID_NOT_CONVERGE",
       "BISECTION_EVENT_NOT_FOUND")
    )
    # check default values
    expect_equal(c( solver@numStages,
                    solver@stepSize,
                    solver@numEqn,
                    solver@tol,
                    solver@enableExceptions),
                    c(6, 0.01, 0, 1e-06, FALSE)
                    )
    # array `a`
    expect_equal(solver@a ,
                 rbind( c(1.0/5.0, 0, 0, 0, 0),
                        c(3.0/40.0, 9.0/40.0, 0, 0, 0),
                        c(3.0/10.0, -9.0/10.0, 6.0/5.0, 0, 0),
                        c(226.0/729.0, -25.0/27.0, 880.0/729.0, 55.0/729.0, 0),
                        c(-181.0/270.0, 5.0/2.0, -266.0/297.0, -91.0/27.0, 189.0/55.0)))
    # array `b5`
    expect_equal(solver@b5,
                 c(19.0/216.0, 0.0, 1000.0/2079.0, -125.0/216.0, 81.0/88.0, 5.0/56.0)
    )
    # array `er`
    expect_equal(solver@er,
                 c(-11.0/360.0, 0.0, 10.0/63.0, -55.0/72.0, 27.0/40.0, -11.0/280.0)
    )

})

test_that("after before/after init values match", {
    # DormandPrince45 <- function(ode) {
    #     new("DormandPrince45", ode)
    # }
    ode = new("ODE")
    solver <- RK45(ode)
    expect_true(class(solver) == "DormandPrince45")
    # state and rate have zero lengths BEFORE init
    expect_equal(length(solver@ode@state), 0)
    expect_equal(length(solver@ode@rate), 0)
    dt <- 0.01
    state <- c(2.00, 0.00, 0.00, 0.25, 0.00)
    solver@ode@state <- state
    solver <- init(solver, dt)
    # test after setting the state
    expect_equal(getState(solver@ode),  c(2.00, 0.00, 0.00, 0.25, 0.00))
    # expect_s4_class(getRate(solver@ode), "ODE")     # returns an object
    expect_equal(getStepSize(solver), 0.01)
    cat(getRate(solver@ode, state))     # returns an object

})


test_that("Solver loop to test time, rateCounts, state[] and getSolution", {
    # ode <- new("ODETest")
    ode <- ODETest()
    ode_solver <- RK45(ode)

    ode_solver <- setStepSize(ode_solver, 1)
    ode_solver <- setTolerance(ode_solver, 1e-8)

    time <-  0

    while (time < 50) {
        ode_solver <- step(ode_solver)
        stepSize <-  getStepSize(ode_solver)
        time <- time + stepSize
        ode <- ode_solver@ode
        state <- getState(ode)
        # cat("time =", time, "\t xl =", state[1], "\t error =",
        #     (state[1] - getExactSolution(ode, time)), "\t n =", ode@n, "\n")
    }
    # test that `time`` and `rateCounts` match
    expect_equal(c(time, getRateCounts(ode)), c(53.25075, 604), tolerance = 0.00001)
    # `n` is zero because is not using stack environment
    expect_equal(c(time, ode@n), c(53.25075, 0), tolerance = 0.00001)

    # test that `state[1]` and `getExactSolution` match
    expect_equal(c(state[1], state[1] - getExactSolution(ode, time)),
                 c(1.053471e-09 , 1.053471e-09), tolerance = 1e-15)
})
