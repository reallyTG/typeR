library(rODE)


### Name: getTime
### Title: getTime
### Aliases: getTime

### ** Examples

# +++++++++++++++++++++++++++++++++++++++++++++++++++   application:  Logistic.R
# Simulates the logistic equation
importFromExamples("Logistic.R")

# Run the application
LogisticApp <- function(verbose = FALSE) {
    x  <- 0.1
    vx <- 0
    r  <- 2        # Malthusian parameter (rate of maximum population growth)
    K  <- 10.0     # carrying capacity of the environment
    dt   <- 0.01; tol  <- 1e-3; tmax <- 10

    population <- Logistic()                # create a Logistic ODE object

    # Two ways of initializing the object
      # population <- init(population, c(x, vx, 0), r, K)
    init(population) <-  list(initState = c(x, vx, 0),
                              r = r,
                              K = K)

    odeSolver <- Verlet(population)        # select the solver

    # Two ways of initializing the solver
      # odeSolver <- init(odeSolver, dt)
    init(odeSolver) <-  dt

    population@odeSolver <- odeSolver
    # setSolver(population) <-  odeSolver

    rowVector <- vector("list")
    i <- 1
    while (getTime(population) <= tmax) {
        rowVector[[i]] <- list(t = getTime(population),
                               s1 = getState(population)[1],
                               s2 = getState(population)[2])
        population <- doStep(population)
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    return(DT)
}
# show solution
solution <- LogisticApp()
plot(solution)
# KeplerEnergy.R
#

setClass("KeplerEnergy", slots = c(
    GM        = "numeric",
    odeSolver = "Verlet",
    counter   = "numeric"
    ),
    contains = c("ODE")
)

setMethod("initialize", "KeplerEnergy", function(.Object, ...) {
    .Object@GM <- 4 * pi * pi         # gravitation constant times combined mass
    .Object@state <- vector("numeric", 5)  # x, vx, y, vy, t
    # .Object@odeSolver <- Verlet(ode = .Object)
    .Object@odeSolver <- Verlet(.Object)
    .Object@counter <- 0
    return(.Object)
})

setMethod("doStep", "KeplerEnergy", function(object, ...) {
    object@odeSolver <- step(object@odeSolver)
    object@state <- object@odeSolver@ode@state
    object
})

setMethod("getTime", "KeplerEnergy", function(object, ...) {
    return(object@state[5])
})

setMethod("getEnergy", "KeplerEnergy", function(object, ...) {
    ke <- 0.5 * (object@state[2] * object@state[2] +
                     object@state[4] * object@state[4])
    pe <- -object@GM / sqrt(object@state[1] * object@state[1] +
                                object@state[3] * object@state[3])
    return(pe+ke)
})


setMethod("init", "KeplerEnergy", function(object, initState, ...) {
    object@state <- initState
    object@odeSolver <- init(object@odeSolver, getStepSize(object@odeSolver))
    object@counter <- 0
    object
})


setReplaceMethod("init", "KeplerEnergy", function(object, ..., value) {
    initState <- value
    object@state <- initState
    object@odeSolver <- init(object@odeSolver, getStepSize(object@odeSolver))
    object@counter <- 0
    object
})

setMethod("getRate", "KeplerEnergy", function(object, state, ...) {
    # Computes the rate using the given state.
    r2 <- state[1] * state[1] + state[3] * state[3]  # distance squared
    r3 <- r2 * sqrt(r2)   # distance cubed
    object@rate[1] <- state[2]
    object@rate[2] <- (- object@GM * state[1]) / r3
    object@rate[3] <- state[4]
    object@rate[4] <- (- object@GM * state[3]) / r3
    object@rate[5] <- 1   # time derivative

    object@counter <- object@counter + 1
    object@rate

})


setMethod("getState", "KeplerEnergy", function(object, ...) {
    # Gets the state variables.
    return(object@state)
})

# constructor
KeplerEnergy <- function() {
    kepler <- new("KeplerEnergy")
    return(kepler)
}



