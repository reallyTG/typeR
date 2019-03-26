library(rODE)


### Name: EulerRichardson-class
### Title: EulerRichardson ODE solver class
### Aliases: EulerRichardson-class .EulerRichardson EulerRichardson
###   init,EulerRichardson-method step,EulerRichardson-method
###   EulerRichardson,ODE-method

### ** Examples

# ++++++++++++++++++++++++++++++++++++++++++++++++++      example: PendulumApp.R
# Simulation of a pendulum using the EulerRichardson ODE solver

suppressPackageStartupMessages(library(ggplot2))

importFromExamples("Pendulum.R")      # source the class

PendulumApp <- function(verbose = FALSE) {
    # initial values
    theta <- 0.2
    thetaDot <- 0
    dt <- 0.1
    pendulum <- Pendulum()
    # pendulum@state[3] <- 0      # set time to zero, t = 0
    pendulum <- setState(pendulum, theta, thetaDot)
    pendulum <- setStepSize(pendulum, dt = dt) # using stepSize in RK4
    pendulum@odeSolver <- setStepSize(pendulum@odeSolver, dt) # set new step size
    rowvec <- vector("list")
    i <- 1
    while (getState(pendulum)[3] <= 40)    {
        rowvec[[i]] <- list(t        = getState(pendulum)[3],    # time
                            theta    = getState(pendulum)[1], # angle
                            thetadot = getState(pendulum)[2]) # derivative of angle
        pendulum <- step(pendulum)
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowvec)
    return(DT)
}
# show solution
solution <- PendulumApp()
plot(solution)



