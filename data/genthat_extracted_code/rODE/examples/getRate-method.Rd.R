library(rODE)


### Name: getRate
### Title: getRate
### Aliases: getRate

### ** Examples

#  Kepler models Keplerian orbits of a mass moving under the influence of an
#  inverse square force by implementing the ODE interface.
#  Kepler.R
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



