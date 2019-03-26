## ---- message=FALSE, results='hold'--------------------------------------
library(rODE)

# This code can also be found in the `examples` folder under this name:
# FallingParticleODE.R
#

setClass("FallingParticleODE", slots = c(
    g = "numeric"
    ),
    prototype = prototype(
        g = 9.8
    ),
    contains = c("ODE")
    )

setMethod("initialize", "FallingParticleODE", function(.Object, ...) {
    .Object@state <- vector("numeric", 3)
    return(.Object)
})

setMethod("getState", "FallingParticleODE", function(object, ...) {
    # Gets the state variables.
    return(object@state)
})

setMethod("getRate", "FallingParticleODE", function(object, state, ...) {
    # Gets the rate of change using the argument's state variables.
    object@rate[1] <- state[2]
    object@rate[2] <- - object@g
    object@rate[3] <- 1
    
    object@rate
})

# constructor
FallingParticleODE <- function(y, v) {
    .FallingParticleODE <- new("FallingParticleODE")
    .FallingParticleODE@state[1] <- y
    .FallingParticleODE@state[2] <- v
    .FallingParticleODE@state[3] <- 0
    .FallingParticleODE
}


## ------------------------------------------------------------------------
# This code can also be found in the `examples` folder under this name:
# 
# FallingParticleODEApp.R
#
#
FallingParticleODEApp <- function(verbose = FALSE) {
    library(ggplot2)
    
    # load the R class that sets up the solver for this application
    
    initial_y <- 10   # initial y position
    initial_v <- 0    # initial x position
    dt        <- 0.01 # delta time for step
    
    
    ball <- FallingParticleODE(initial_y, initial_v)
    
    solver <- Euler(ball)
    solver <- setStepSize(solver, dt)
    
    rowVector <- vector("list")
    i <- 1
    # stop loop when the ball hits the ground
    while (ball@state[1] >= 0) {
        rowVector[[i]] <- list(state1 = ball@state[1], 
                               state2 = ball@state[2], 
                               state3 = ball@state[3])
        solver <- step(solver)
        ball <- solver@ode
        if (verbose) {
            cat(sprintf("%12f %12f ",  ball@state[1], ball@rate[1] ))
            cat(sprintf("%12f %12f ",  ball@state[2], ball@rate[2] ))
            cat(sprintf("%12f %12f\n", ball@state[3], ball@rate[3] ))
        }
        i <- i + 1
    }
    
    DT <- data.table::rbindlist(rowVector)
    print(ggplot(DT, aes(x = state3, y = state1)) + geom_line(col = "blue"))
    print(ggplot(DT, aes(x = state3, y = state2)) + geom_line(col = "red"))
}


FallingParticleODEApp()

