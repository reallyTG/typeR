library(rODE)


### Name: getState
### Title: getState
### Aliases: getState

### ** Examples

# ++++++++++++++++++++++++++++++++++++++++++++++++   application: VanderPolApp.R
# Solution of the Van der Pol equation
#
importFromExamples("VanderPol.R")

# run the application
VanderpolApp <- function(verbose = FALSE) {
    # set the orbit into a predefined state.
    y1 <- 2; y2 <- 0; dt <- 0.1;
    rigid_body <- VanderPol(y1, y2)
    solver <- RK45(rigid_body)
    rowVector <- vector("list")
    i <- 1
    while (getState(rigid_body)[3] <= 20) {
        rowVector[[i]] <- list(t  = getState(rigid_body)[3],
                               y1 = getState(rigid_body)[1],
                               y2 = getState(rigid_body)[2])
        solver     <- step(solver)
        rigid_body <- getODE(solver)
        i <-  i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    return(DT)

}
# show solution
solution <- VanderpolApp()
plot(solution)

# ++++++++++++++++++++++++++++++++++++++++++++++++++application:  SpringRK4App.R
# Simulation of a spring considering no friction

importFromExamples("SpringRK4.R")


# run application
SpringRK4App <- function(verbose = FALSE) {
    theta    <- 0
    thetaDot <- -0.2
    tmax     <- 22; dt <- 0.1
    spring <- SpringRK4()
    spring@state[3] <- 0      # set time to zero, t = 0
    spring <- setState(spring, theta, thetaDot)
    #  spring <- setStepSize(spring, dt = dt) # using stepSize in RK4
    spring@odeSolver <- setStepSize(spring@odeSolver, dt) # set new step size
    rowvec <- vector("list")
    i <- 1
    while (getState(spring)[3] <= tmax)    {
        rowvec[[i]] <- list(t  = getState(spring)[3],      # angle
                            y1 = getState(spring)[1],      # derivative of the angle
                            y2 = getState(spring)[2])      # time
        i <- i + 1
        spring <- step(spring)
    }
    DT <- data.table::rbindlist(rowvec)
    return(DT)
}

# show solution
solution <- SpringRK4App()
plot(solution)



