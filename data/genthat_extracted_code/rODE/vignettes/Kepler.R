## ----message=FALSE, results='hold'---------------------------------------
library(rODE)

# This code can also be found in the `examples` folder under this name:
#
# Kepler.R
#

setClass("Kepler", slots = c(
    GM = "numeric"
    ),
    contains = c("ODE")
)

setMethod("initialize", "Kepler", function(.Object, ...) {
    .Object@GM <- 1.0                 # gravitation constant times combined mass
    .Object@state <- vector("numeric", 5)  # x, vx, y, vy, t
    return(.Object)
})


setMethod("getState", "Kepler", function(object, ...) {
    # Gets the state variables.
    return(object@state)
})

setMethod("getRate", "Kepler", function(object, state, ...) {
    # Computes the rate using the given state.
    r2 <- state[1] * state[1] + state[3] * state[3]  # distance squared
    r3 <- r2 * sqrt(r2)   # distance cubed
    object@rate[1] <- state[2]
    object@rate[2] <- (- object@GM * state[1]) / r3
    object@rate[3] <- state[4]
    object@rate[4] <- (- object@GM * state[3]) / r3
    object@rate[5] <- 1   # time derivative

    object@rate
})

# constructor
Kepler <- function(r, v) {
    kepler <- new("Kepler")
    kepler@state[1] = r[1]
    kepler@state[2] = v[1]
    kepler@state[3] = r[2]
    kepler@state[4] = v[2]
    kepler@state[5] = 0
    return(kepler)
}

## ------------------------------------------------------------------------

# This code can also be found in the `examples` folder under this name:
# KeplerApp.R
#
KeplerApp <- function(verbose = FALSE) {
    
    # set the orbit into a predefined state.
    r <- c(2, 0)
    v <- c(0, 0.25)
    dt <- 0.1
    
    planet <- Kepler(r, v)
    solver <- RK45(planet)
    
    # solver <- step(solver)
    
    while (planet@state[5] <= 10) {
        solver <- step(solver)
        planet <- solver@ode
        if (verbose)
            cat(sprintf("state[1]=%10f, state[2]= %10f,  
                        state[3]=%10f, state[5]=%10f\n",
                    planet@state[1],
                    planet@state[2], planet@state[3], planet@state[5]))
    }
    
# at t=100, dt=0.1,  c(2.131958,     1.105316,   100.000000)
# Java: state[0] = 0.444912, state[1]= -1.436203, state[2]= 0.459081, state[4]= 10.033245
#       currentStep=    0.061646
# R:    state[1] = 0.444912, state[2]= -1.436203, state[3]= 0.459081, state[5]= 10.033245
#       currentStep= 0.06164632
}

KeplerApp(verbose = TRUE)

