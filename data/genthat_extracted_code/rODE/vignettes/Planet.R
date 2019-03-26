## ----message=FALSE, results='hold'---------------------------------------
library(rODE)

# This code can also be found in the `examples` folder under this name:
# 
# Planet.R
#
setClass("Planet", slots = c(
    odeSolver = "Euler",
    GM = "numeric"
    ),
    contains = c("ODE")
)

setMethod("initialize", "Planet", function(.Object, ...) {
    .Object@GM <- 4 * pi * pi
    .Object@state <- vector("numeric", 5)
    .Object@odeSolver <- Euler(.Object)
    return(.Object)
})

setMethod("doStep", "Planet", function(object, ...) {
    # Gets the state variables.
    object@odeSolver <- step(object@odeSolver)
    object@state <- object@odeSolver@ode@state
    object@rate  <- object@odeSolver@ode@rate
    invisible(object)
})

setMethod("init", "Planet", function(object, initState, ...) {
    object@state <- object@odeSolver@ode@state <- initState
    # initialize providing the step size
    object@odeSolver <- init(object@odeSolver, getStepSize(object@odeSolver))
    object@rate <- object@odeSolver@ode@rate
    object@state <- object@odeSolver@ode@state

    object

})

setMethod("getRate", "Planet", function(object, state, ...) {
    # Gets the rate of change using the argument's state variables.
    r2 <- state[1] * state[1] + state[3] * state[3]
    r3 <- r2 * sqrt(r2)
    object@rate[1] <- state[2]
    object@rate[2] <- (- object@GM * state[1]) / r3
    object@rate[3] <- state[4]
    object@rate[4] <- (- object@GM * state[3]) / r3
    object@rate[5] <- 1

    object@rate

})

setMethod("getState", "Planet", function(object, ...) {
    # Gets the state variables.
    invisible(object@state)
})

# constructor
Planet <- function() {
    new("Planet")
}




## ------------------------------------------------------------------------
# #################
# This code can also be found in the `examples` folder under this name:
# PlanetApp.R
#
#
PlanetApp <- function(verbose = FALSE) {
        
    # x =  1, AU or Astronomical Units. 
    # Length of semimajor axis or the orbit of the Earth around the Sun.
    
    x <- 1; vx <- 0; y <- 0; vy <- 6.28; t <- 0
    state <- c(x, vx, y, vy, t)
    dt <-  0.01
    
    planet <- Planet()
    
    planet@odeSolver <- setStepSize(planet@odeSolver, dt)
    planet <- init(planet, initState = state)
    
    # run infinite loop. stop with ESCAPE.
    while (planet@state[5] <= 30) {  # Earth orbit is 365 days around the sun
        for (i in 1:5) {               # advances time
            planet <- doStep(planet)
        }
        if (verbose) 
            cat(sprintf("%12f %12f %12f %12f %12f \n",
                    planet@state[1], planet@state[2], planet@state[3],
                    planet@state[4], planet@state[5]))
    }

}

PlanetApp()
PlanetApp(verbose = TRUE)

