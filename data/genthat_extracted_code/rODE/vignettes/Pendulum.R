## ----message=FALSE, results='hold'---------------------------------------
library(rODE)
# This code can also be found in the `examples` folder under this name:
#
# Pendulum.R
#
# Original Pendulum class uses Euler-Richardson solver
#

setClass("Pendulum", slots = c(
    omega0Squared = "numeric",
    state = "numeric",
    odeSolver = "EulerRichardson"
    ),
    prototype = prototype(
        omega0Squared = 3,
        state = c(0, 0, 0)
    ),
    contains = c("ODE")
    )

setMethod("initialize", "Pendulum", function(.Object) {
    .Object@odeSolver <- EulerRichardson(.Object)
    return(.Object)
})

setMethod("setStepSize", signature("Pendulum"), function(object, dt, ...) {
    # use explicit parameter declaration
    # setStepSize generic may use two different step parameters: stepSize and dt
    object@odeSolver <- setStepSize(object@odeSolver, dt)
    object
})


setMethod("step", "Pendulum", function(object) {
    object@odeSolver <- step(object@odeSolver)
    object@rate  <- object@odeSolver@ode@rate
    object@state <- object@odeSolver@ode@state
    object
})

setMethod("setState", signature("Pendulum"), function(object, theta, thetaDot, ...) {
    object@state[1] <- theta     # angle
    object@state[2] <- thetaDot  # derivative of angle
    #                              state[3] is time
    object@odeSolver@ode@state <- object@state
    object
})

setMethod("getState", "Pendulum", function(object) {
    object@state
})


setMethod("getRate", "Pendulum", function(object, state, ...) {
    object@rate[1] <- state[2]     # rate of change of angle
    object@rate[2] <- -object@omega0Squared * sin(state[1]) # rate of change dtheta
    object@rate[3] <- 1            # rate of change of time, dt/dt

    object@rate
})


# constructor
Pendulum <- function()  new("Pendulum")


## ------------------------------------------------------------------------
# #############
# This code can also be found in the `examples` folder under this name:
#
# PendulumApp.R
#
PendulumApp <- function(verbose = FALSE) {
    
    library(ggplot2)
    
    ode <- new("ODE")
    pendulum <- Pendulum()
    
    dt <- 0.1
    theta <- 0.2
    thetaDot <- 0
    
    pendulum@state[3] <- 0      # set time to zero, t = 0
    
    pendulum <- setState(pendulum, theta, thetaDot)
    pendulum <- setStepSize(pendulum, dt = dt) # using stepSize in RK4
    
    pendulum@odeSolver <- setStepSize(pendulum@odeSolver, dt) # set new step size
    
    rowvec <- vector("list")
    i <- 1
    while (pendulum@state[3] <= 1000)    {
        rowvec[[i]] <- list(state1 = pendulum@state[1], # angle
                            state2 = pendulum@state[2],  # derivative of the angle
                            state3 = pendulum@state[3])       # time
        if (verbose)
            cat(sprintf("state1=%12f state2=%12f state3=%12f \n", 
                        pendulum@state[1], pendulum@state[2], pendulum@state[3]))
        i <- i + 1
        pendulum <- step(pendulum)
    }
    DT.ER<- data.table::rbindlist(rowvec)
    
    print(ggplot(DT.ER, aes(x = state3, y = state1)) + geom_line(col = "blue"))
    print(ggplot(DT.ER, aes(x = state3, y = state2)) + geom_line(col = "red"))
    # save(DTRK4, file = "./data/pendulumRK4_1e-3.rda")
}


PendulumApp()


