library(rODE)


### Name: getRateCounter
### Title: getRateCounter
### Aliases: getRateCounter

### ** Examples

# ++++++++++++++++++++++++++++++++++++++++++++++++  example: ComparisonRK45App.R
# Compares the solution by the RK45 ODE solver versus the analytical solution
# Example file: ComparisonRK45App.R
# ODE Solver:   Runge-Kutta 45
# ODE class :   RK45
# Base class:   ODETest

importFromExamples("ODETest.R")

 ComparisonRK45App <- function(verbose = FALSE) {
     ode <- new("ODETest")                     # create an `ODETest` object
     ode_solver <- RK45(ode)                   # select the ODE solver
     ode_solver <- setStepSize(ode_solver, 1)      # set the step

     # Two ways of setting the tolerance
       # ode_solver <- setTolerance(ode_solver, 1e-8)  # set the tolerance
     setTolerance(ode_solver) <-  1e-8

     time <-  0
     rowVector <- vector("list")
     i <- 1
     while (time < 50) {
         rowVector[[i]] <- list(t  = getState(ode)[2],
                                s1 = getState(ode)[1],
                                s2 = getState(ode)[2],
                                xs = getExactSolution(ode, time),
                                counts = getRateCounts(ode),
                                time   = time
                                )
         ode_solver <- step(ode_solver)           # advance one step
         stepSize   <- getStepSize(ode_solver)
         time <- time + stepSize
         ode  <- getODE(ode_solver)                     # get updated ODE object
         i <- i + 1
     }
     return(data.table::rbindlist(rowVector))    # a data table with the results
 }
# show solution
solution <- ComparisonRK45App()                          # run the example
plot(solution)



