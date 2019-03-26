library(testthat)
context("test AdaptiveStepApp")


setClass("Impulse", contains = c("ODE"),
         slots = c(
             epsilon = "numeric"
         ))

setMethod("initialize", signature = c("Impulse"), function(.Object) {
    .Object@epsilon <- 0.01
    .Object@state <- c(-3.0, 1.0, 0.0)    # x, v, t
    return(.Object)
})

setMethod("getState", signature = c("Impulse"), function(object, ...) {
    return(object@state)
})

setMethod("getRate", signature = c("Impulse"), function(object, state, ...) {
    object@rate[1] <- state[2]
    object@rate[2] <- object@epsilon / ( object@epsilon * object@epsilon +
        state[1] * state[1] )
    object@rate[3] <- 1                             # dt/dt

        return(object@rate)
})


# main
ode        <- new("Impulse")
ode_solver <- RK45(ode)
ode_solver <- init(ode_solver, 0.1)
ode_solver <- setTolerance(ode_solver, 1.0e-4)

while (getState(ode)[1] < 12) {
    ode_solver <- step(ode_solver)
    ode <- ode_solver@ode
    # cat(sprintf("state[1] =%12f, state[3] =%12f, state[2] =%12f \n", getState(ode)[1], getState(ode)[3], getState(ode)[2]))
}

test_that("output equals to expected values", {
    expect_equal(c(getState(ode)[1], getState(ode)[3], getState(ode)[2]),
    c(19.254268,   10.099912, 2.697305), tolerance = 1.0e-7)
})
