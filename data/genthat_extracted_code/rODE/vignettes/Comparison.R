## ----message=FALSE, results="hold"---------------------------------------
library(rODE)

# ODETest.R

setClass("ODETest", slots = c(
    n     = "numeric"           # counts the number of getRate evaluations
    ),
    contains = c("ODE")
    )

setMethod("initialize", "ODETest", function(.Object, ...) {
    .Object@n     <-  0
    .Object@state <- c(5.0, 0.0)
    return(.Object)
})

setMethod("getExactSolution", "ODETest", function(object, t, ...) {
    # analytical solution
    return(5.0 * exp(-t))
})

setMethod("getState", "ODETest", function(object, ...) {
    object@state
})

setMethod("getRate", "ODETest", function(object, state, ...) {
    object@rate[1] <- -state[1]
    object@rate[2] <-  1            # rate of change of time, dt/dt
    object@n       <-  object@n + 1
    object@rate
})

# constructor
ODETest <- function() {
    odetest <- new("ODETest")
    odetest
}

## ------------------------------------------------------------------------
# This script can also be found under ./demo
# ComparisonRK45App.R
# 
# Compares the solution by the RK45 ODE solver versus the analytical solution

ComparisonRK45App <- function(verbose = FALSE) {
    ode <- new("ODETest")
    ode_solver <- RK45(ode)
    ode_solver <- setStepSize(ode_solver, 1)
    ode_solver <- setTolerance(ode_solver, 1e-8)
    
    time <-  0
    while (time < 50) {
        ode_solver <- step(ode_solver)
        stepSize <-  ode_solver@stepSize     # update the step size
        time <- time + stepSize
        # ode <- ode_solver@ode
        state <- getState(ode_solver@ode)
        if (verbose)
            cat(sprintf("time=%10f xl=%14e error=%14e n=%5d \n", 
                        time, state[1],
                    (state[1] - getExactSolution(ode_solver@ode, time)),
                    ode_solver@ode@n))
    }
    cat("rate steps evaluated #", ode_solver@ode@n)
}

ComparisonRK45App(verbose = TRUE)

## ----message=FALSE, results="hold"---------------------------------------
library(rODE)

setClass("ODETest", slots = c(
    stack = "environment"           # environment object inside the class
    ),
    contains = c("ODE")
    )

setMethod("initialize", "ODETest", function(.Object, ...) {
    .Object@stack$n <-  0               # "n" belongs to the class environment
    .Object@state   <- c(5.0, 0.0)
    return(.Object)
})

setMethod("getExactSolution", "ODETest", function(object, t, ...) {
    # analytical solution
    return(5.0 * exp(-t))
})

setMethod("getState", "ODETest", function(object, ...) {
    object@state
})

setMethod("getRate", "ODETest", function(object, state, ...) {
    object@rate[1] <- -state[1]
    object@rate[2] <-  1                        # rate of change of time, dt/dt
    object@stack$n <-  object@stack$n + 1       # add 1 to the rate count
    object@rate
})

# constructor
ODETest <- function() {
    odetest <- new("ODETest")
    odetest
}

# class implementation
ComparisonRK45App <- function(verbose = FALSE) {
    ode <- new("ODETest")
    ode_solver <- RK45(ode)
    ode_solver <- setStepSize(ode_solver, 1)
    ode_solver <- setTolerance(ode_solver, 1e-8)
    
    cat(sprintf("%10s %14s %14s %5s \n", "time", "xl", "error", "n"))   # header
    time <-  0
    while (time < 50) {
        ode_solver <- step(ode_solver)
        stepSize <-  ode_solver@stepSize     # update the step size
        time <- time + stepSize
        state <- getState(ode_solver@ode)
        if (verbose)
            cat(sprintf("%10f %14e %14e %5d \n", 
                        time, state[1],
                    (state[1] - getExactSolution(ode_solver@ode, time)),
                    ode_solver@ode@stack$n))
    }
    cat("rate steps evaluated #", ode_solver@ode@stack$n)
}

ComparisonRK45App(verbose = TRUE)

