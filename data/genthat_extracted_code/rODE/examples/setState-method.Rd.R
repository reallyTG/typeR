library(rODE)


### Name: setState
### Title: setState
### Aliases: setState

### ** Examples

# +++++++++++++++++++++++++++++++++++++++++++++++++ application: ProjectileApp.R
#                                                      test Projectile with RK4
#                                                      originally uses Euler

# suppressMessages(library(data.table))

importFromExamples("Projectile.R")      # source the class

ProjectileApp <- function(verbose = FALSE) {
    # initial values
    x <- 0; vx <- 10; y <- 0; vy <- 10
    state <- c(x, vx, y, vy, 0)                        # state vector
    dt <- 0.01

    projectile <- Projectile()
    projectile <- setState(projectile, x, vx, y, vy)

    projectile@odeSolver <- init(projectile@odeSolver, 0.123)

    # init(projectile) <-  0.123

    projectile@odeSolver <- setStepSize(projectile@odeSolver, dt)
    rowV <- vector("list")
    i <- 1
    while (getState(projectile)[3] >= 0)    {
        rowV[[i]] <- list(t  = getState(projectile)[5],
                          x  = getState(projectile)[1],
                          vx = getState(projectile)[2],
                          y  = getState(projectile)[3],     # vertical position
                          vy = getState(projectile)[4])
        projectile <- step(projectile)
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowV)
    return(DT)
}


solution <- ProjectileApp()
plot(solution)
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



