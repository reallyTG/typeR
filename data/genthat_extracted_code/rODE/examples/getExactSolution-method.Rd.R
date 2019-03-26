library(rODE)


### Name: getExactSolution
### Title: getExactSolution
### Aliases: getExactSolution

### ** Examples

# ++++++++++++++++++++++++++++++++++++++++++++++++  example: ComparisonRK45App.R
# Compares the solution by the RK45 ODE solver versus the analytical solution
# Example file: ComparisonRK45App.R
# ODE Solver:   Runge-Kutta 45
# ODE class :   RK45
# Base class:   ODETest

importFromExamples("ODETest.R")

 ComparisonRK45App <- function(verbose = FALSE) {
     ode <- new("ODETest")                     # create an `ODETest` object
     ode_solver <- RK45(ode)                   # select the ODE solver
     ode_solver <- setStepSize(ode_solver, 1)      # set the step

     # Two ways of setting the tolerance
       # ode_solver <- setTolerance(ode_solver, 1e-8)  # set the tolerance
     setTolerance(ode_solver) <-  1e-8

     time <-  0
     rowVector <- vector("list")
     i <- 1
     while (time < 50) {
         rowVector[[i]] <- list(t  = getState(ode)[2],
                                s1 = getState(ode)[1],
                                s2 = getState(ode)[2],
                                xs = getExactSolution(ode, time),
                                counts = getRateCounts(ode),
                                time   = time
                                )
         ode_solver <- step(ode_solver)           # advance one step
         stepSize   <- getStepSize(ode_solver)
         time <- time + stepSize
         ode  <- getODE(ode_solver)                     # get updated ODE object
         i <- i + 1
     }
     return(data.table::rbindlist(rowVector))    # a data table with the results
 }
# show solution
solution <- ComparisonRK45App()                          # run the example
plot(solution)
# ODETest.R
# Called as base class for examples:
#                         ComparisonRK45App.R
#                         ComparisonRK45ODEApp.R

#' ODETest as an example of ODE class inheritance
#'
#' ODETest is a base class for examples ComparisonRK45App.R and
#' ComparisonRK45ODEApp.R. ODETest also uses an environment variable to store
#' the rate counts.
#'
#' @rdname ODE-class-example
#' @include ODE.R
setClass("ODETest", slots = c(
    n     = "numeric",           # counts the number of getRate evaluations
    stack = "environment"        # environnment object to accumulate rate counts
    ),
    contains = c("ODE")
    )

setMethod("initialize", "ODETest", function(.Object, ...) {
    .Object@stack$rateCounts <-  0              # counter for rate calculations
    .Object@state <- c(5.0, 0.0)
    return(.Object)
})

#' @rdname getExactSolution-method
setMethod("getExactSolution", "ODETest", function(object, t, ...) {
    return(5.0 * exp(-t))
})

#' @rdname getState-method
setMethod("getState", "ODETest", function(object, ...) {
    object@state
})

#' @rdname getRate-method
setMethod("getRate", "ODETest", function(object, state, ...) {
    object@rate[1] <- - state[1]
    object@rate[2] <-  1            # rate of change of time, dt/dt
    # accumulate how many times the rate has been called to calculate
    object@stack$rateCounts <- object@stack$rateCounts + 1
    object@state <- state
    object@rate
})


#' @rdname getRateCounts-method
setMethod("getRateCounts", "ODETest", function(object, ...) {
    # use environment stack to accumulate rate counts
    object@stack$rateCounts
})

# constructor
ODETest <- function() {
    odetest <- new("ODETest")
    odetest
}



