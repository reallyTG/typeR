library(rODE)


### Name: getStepSize
### Title: getStepSize
### Aliases: getStepSize

### ** Examples

# +++++++++++++++++++++++++++++++++++++++++ Example:      ComparisonRK45ODEApp.R
# Updates the ODE state instead of using the internal state in the ODE solver
# Also plots the solver solution versus the analytical solution at a
# tolerance of 1e-6
# Example file: ComparisonRK45ODEApp.R
# ODE Solver:   Runge-Kutta 45
# ODE class :   RK45
# Base class:   ODETest

library(ggplot2)
library(dplyr)
library(tidyr)

importFromExamples("ODETest.R")

ComparisonRK45ODEApp <- function(verbose = FALSE) {
    ode <- new("ODETest")                         # new ODE instance
    ode_solver <- RK45(ode)                       # select ODE solver
    ode_solver <- setStepSize(ode_solver, 1)      # set the step

    # two ways to set tolerance
      # ode_solver <- setTolerance(ode_solver, 1e-6)
    setTolerance(ode_solver) <-  1e-6

    time <-  0
    rowVector <- vector("list")                   # row vector
    i <- 1    # counter
    while (time < 50) {
        # add solution objects to a row vector
        rowVector[[i]] <- list(t     = getState(ode)[2],
                               ODE   = getState(ode)[1],
                               s2    = getState(ode)[2],
                               exact = getExactSolution(ode, time),
                               rate.counts = getRateCounts(ode),
                               time = time )
        ode_solver <- step(ode_solver)            # advance solver one step
        stepSize <-  getStepSize(ode_solver)      # get the current step size
        time  <- time + stepSize
        ode   <- getODE(ode_solver)               # get updated ODE object
        state <- getState(ode)                    # get the `state` vector
        i <- i + 1                                # add a row vector
    }
    DT <- data.table::rbindlist(rowVector)        # create data table
    return(DT)
}

solution <- ComparisonRK45ODEApp()
plot(solution)


# aditional plot for analytics solution vs. RK45 solver
solution.multi <- solution %>%
    select(t, ODE, exact)
plot(solution.multi)             # 3x3 plot

# plot comparative curves analytical vs ODE solver
solution.2x1 <- solution.multi %>%
    gather(key, value, -t)         # make a table of 3 variables. key: ODE/exact

g <- ggplot(solution.2x1, mapping = aes(x = t, y = value, color = key))
g <-  g + geom_line(size = 1) +
    labs(title = "ODE vs Exact solution",
         subtitle = "tolerance = 1E-6")
print(g)







