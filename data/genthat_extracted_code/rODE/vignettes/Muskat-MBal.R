## ----message=FALSE, results="hold"---------------------------------------
# the ODE object
library(rODE)
library(ggplot2)

# class declaration
setClass("MuskatODE", slots = c(
    stack = "environment"                  # environment object inside the class
    ),
    contains = c("ODE")
    )
# Initialization method
setMethod("initialize", "MuskatODE", function(.Object, ...) {
    .Object@stack$n <-  0               
    return(.Object)
})
# The exact solution method
setMethod("getExactSolution", "MuskatODE", function(object, t, ...) {
    # analytical solution
    return(3 * exp(t) - 2 *t - 2)                             # constant C1 = 3 
})
# obtain the state of the ODE
setMethod("getState", "MuskatODE", function(object, ...) {
    object@state                                      # return the state
})
# the differential equation is entered here. 
setMethod("getRate", "MuskatODE", function(object, state, ...) {
    object@rate[1] <- state[1] + 2 * state[2]         # 2P + S
    object@rate[2] <- 1                               # dP/dP
    object@stack$n <- object@stack$n + 1              # add 1 to the rate count
    object@rate                                       # return the rate
})
# constructor
MuskatODE <- function(P, S) {
    .MuskatEuler <- new("MuskatODE")
    .MuskatEuler@state[1] = S        # S         state[1] is saturation
    .MuskatEuler@state[2] = P        # P = t     state[2] is pressure
    return(.MuskatEuler)
}

## ------------------------------------------------------------------------
# application that uses the Muskat ODE solver above
MuskatEulerApp <- function(stepSize) {
    ode <- MuskatODE(0, 1)                      # initial state  S(0) = 1; P = 0
    ode_solver <- Euler(ode)                    # use the Euler ODE solver
    ode_solver <- setStepSize(ode_solver, stepSize)
    rowVector <- vector("list")      # calculation will be added to rowVector
    pres <-  0                       # P = 0
    i    <-  1                       # index of the iterations
    while (pres < 0.5) {
        state <- getState(ode_solver@ode)  
        pres  <- state[2]
        error <- getExactSolution(ode_solver@ode, pres) - state[1]
        rowVector[[i]] <- list(step_size = stepSize,  # vector with calculations
                               P = pres, 
                               S = state[1], 
                               exact = getExactSolution(ode_solver@ode, pres),
                               error = error, 
                               rel_err = error / getExactSolution(ode_solver@ode, pres),
                               steps = ode_solver@ode@stack$n
                               )
        ode_solver <- step(ode_solver)                 # advance solver one step
        i <- i + 1                                     # advance iteration
    }
    data.table::rbindlist(rowVector)                   # results in data table
}

## ------------------------------------------------------------------------
# get a summary table for different step sizes
get_table <- function(stepSize) {
    dt <- MuskatEulerApp(stepSize)
    dt[round(P, 2) %in% c(0.10, 0.20, 0.30, 0.40, 0.5)]  
}
# vector with some step sizes
step_sizes <- c(0.2, 0.1, 0.05)
dt_li <- lapply(step_sizes, get_table)    # create a data table 
data.table::rbindlist(dt_li)              # bind the data tables

## ------------------------------------------------------------------------
MuskatRK4App <- function(stepSize) {
    ode <- MuskatODE(0, 1)
    ode_solver <- RK4(ode)
    ode_solver <- setStepSize(ode_solver, stepSize)
    rowVector  <- vector("list")
    pres <-  0
    i    <-  1
    while (pres < 0.5) {
        state <- getState(ode_solver@ode)
        pres <- state[2]
        error <- getExactSolution(ode_solver@ode, pres) - state[1]
        rowVector[[i]] <- list(step_size = stepSize, 
                               P = pres, 
                               S = state[1], 
                               exact = getExactSolution(ode_solver@ode, pres),
                               error = error, 
                               rel_err = error / getExactSolution(ode_solver@ode, pres),
                               steps = ode_solver@ode@stack$n
                               )
        ode_solver <- step(ode_solver)
        i <- i + 1
    }
    data.table::rbindlist(rowVector)
}
# get a summary table for different step sizes
get_table <- function(stepSize) {
    dt <- MuskatRK4App(stepSize)
    dt[round(P, 2) %in% c(0.10, 0.20, 0.30, 0.40, 0.5)]
}
step_sizes <- c(0.2, 0.1, 0.05)
dt_li <- lapply(step_sizes, get_table)
data.table::rbindlist(dt_li)

## ------------------------------------------------------------------------
ComparisonMuskatODEApp <- function(solver, stepSize) {
    ode <- MuskatODE(0, 1)
    solver_factory <- ODESolverFactory()
    ode_solver <- createODESolver(solver_factory, ode, solver)
    ode_solver <- setStepSize(ode_solver, stepSize)
    rowVector  <- vector("list")
    pres <-  0
    i    <-  1
    while (pres < 0.5001) {
        state <- getState(ode_solver@ode)
        pres  <- state[2]
        error <- getExactSolution(ode_solver@ode, pres) - state[1]
        rowVector[[i]] <- list(solver = solver,
                               step_size = stepSize, 
                               P = pres, 
                               S = state[1], 
                               exact = getExactSolution(ode_solver@ode, pres),
                               error = error, 
                               rel_err = error / getExactSolution(ode_solver@ode, pres),
                               steps = ode_solver@ode@stack$n
                               )
        ode_solver <- step(ode_solver)
        pres <- pres + getStepSize(ode_solver)    # step size retrievd from ODE solver
        i <- i + 1
    }
    data.table::rbindlist(rowVector)
}
# get a summary table for different step sizes
create_table <- function(stepSize, solver) {
    dt <- ComparisonMuskatODEApp(solver, stepSize)
    if (!solver == "RK45") dt[round(P, 2) %in% c(0.10, 0.20, 0.30, 0.40, 0.5)]
    else dt
}

## ------------------------------------------------------------------------
# Create summary table for ODE solver Euler
step_sizes <- c(0.2, 0.1, 0.05)
dt_li <- lapply(step_sizes, create_table, solver = "Euler")
data.table::rbindlist(dt_li)

## ------------------------------------------------------------------------
# Create summary table for ODE solver EulerRichardson
step_sizes <- c(0.2, 0.1, 0.05)
dt_li <- lapply(step_sizes, create_table, solver = "EulerRichardson")
data.table::rbindlist(dt_li)

## ------------------------------------------------------------------------
# Create summary table for ODE solver RK4
step_sizes <- c(0.2, 0.1, 0.05)
dt_li <- lapply(step_sizes, create_table, solver = "RK4")
data.table::rbindlist(dt_li)

## ------------------------------------------------------------------------
# Create summary table for ODE solver RK45
step_sizes <- c(0.2, 0.1, 0.05)

# do not round because RK45 makes variable step sizes
dt_li <- lapply(step_sizes, create_table, solver = "RK45")
data.table::rbindlist(dt_li)

## ------------------------------------------------------------------------
# vectors for the solvers and step sizes
step_sizes <- c(0.2, 0.1, 0.05)
solvers <- c("Euler", "EulerRichardson", "Verlet", "RK4", "RK45")

## ------------------------------------------------------------------------
# nested lapply to iterate through solvers and step sizes
df_li <- lapply(solvers, function(svr)
            lapply(step_sizes, function(stepsz) create_table(stepsz, svr)))

# join the resulting dataframes
df_all <- data.table::rbindlist(unlist(df_li, recursive = FALSE))
df_all

## ------------------------------------------------------------------------
ggplot(df_all, aes(x = P, y = rel_err, group = step_size, fill = solver )) +
    geom_line() + 
    geom_area(stat = "identity") + 
    facet_grid(step_size ~ solver)

## ------------------------------------------------------------------------
ggplot(subset(df_all, solver %in% c("RK4", "RK45") & step_size %in% c(0.1, 0.05)), aes(x = P, y = rel_err, group = step_size, fill = solver )) +
    geom_line() + 
    geom_area(stat = "identity") + 
    facet_grid(step_size ~ solver) 

## ------------------------------------------------------------------------
MuskatODEApp <- function(solver, stepSize, pmax) {
    ode <- MuskatODE(0, 1)
    solver_factory <- ODESolverFactory()
    ode_solver <- createODESolver(solver_factory, ode, solver)
    ode_solver <- setStepSize(ode_solver, stepSize)
    rowVector  <- vector("list")
    pres <-  0
    i    <-  1
    while (pres < pmax) {
        state <- getState(ode_solver@ode)
        pres  <- state[2]
        error <- getExactSolution(ode_solver@ode, pres) - state[1]
        rowVector[[i]] <- list(solver = solver,
                               step_size = stepSize, 
                               P = pres, 
                               S = state[1], 
                               exact = getExactSolution(ode_solver@ode, pres),
                               error = error, 
                               rel_err = error / getExactSolution(ode_solver@ode, pres),
                               steps = ode_solver@ode@stack$n
                               )
        ode_solver <- step(ode_solver)
        pres <- pres + getStepSize(ode_solver)    # step size retrievd from ODE solver
        i <- i + 1
    }
    data.table::rbindlist(rowVector)
}

solver   <- "RK4"
stepSize <- 0.05
pmax     <- 3.0
dt <- MuskatODEApp(solver, stepSize, pmax)
dt


## ------------------------------------------------------------------------
last_row <- tail(dt, 1)
last_row

## ------------------------------------------------------------------------
ggplot(dt, aes(x = P, y = S)) +
    geom_point()

