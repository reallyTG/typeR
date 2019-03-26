library(rODE)


### Name: ODESolverFactory-class
### Title: ODESolverFactory
### Aliases: ODESolverFactory-class .ODESolverFactory ODESolverFactory
###   createODESolver createODESolver,ODESolverFactory-method
###   ODESolverFactory,ANY-method

### ** Examples

# This example uses ODESolverFactory

importFromExamples("SHO.R")

# SHOApp.R
SHOApp <- function(...) {
    x <- 1.0; v <- 0; k <- 1.0; dt <- 0.01; tolerance <- 1e-3
    sho    <- SHO(x, v, k)

    # Use ODESolverFactory
    solver_factory <- ODESolverFactory()
    solver <- createODESolver(solver_factory, sho, "DormandPrince45")
    # solver <- DormandPrince45(sho)                    # this can also be used

    # Two ways of setting the tolerance
    # solver <- setTolerance(solver, tolerance)           # or this below
    setTolerance(solver) <-  tolerance

    # Two ways of initializing the solver
      # solver <- init(solver, dt)
    init(solver) <- dt

    i <- 1; rowVector <- vector("list")
    while (getState(sho)[3] <= 500) {
        rowVector[[i]] <- list(x = getState(sho)[1],
                               v = getState(sho)[2],
                               t = getState(sho)[3])
        solver <- step(solver)
        sho    <- getODE(solver)
        i <- i + 1
    }
    return(data.table::rbindlist(rowVector))
}

solution <- SHOApp()
plot(solution)


# This example uses ODESolverFactory

importFromExamples("SHO.R")

# SHOApp.R
SHOApp <- function(...) {
    x <- 1.0; v <- 0; k <- 1.0; dt <- 0.01; tolerance <- 1e-3
    sho    <- SHO(x, v, k)

    # Use ODESolverFactory
    solver_factory <- ODESolverFactory()
    solver <- createODESolver(solver_factory, sho, "DormandPrince45")
    # solver <- DormandPrince45(sho)                    # this can also be used

    # Two ways of setting the tolerance
    # solver <- setTolerance(solver, tolerance)           # or this below
    setTolerance(solver) <-  tolerance

    # Two ways of initializing the solver
      # solver <- init(solver, dt)
    init(solver) <- dt

    i <- 1; rowVector <- vector("list")
    while (getState(sho)[3] <= 500) {
        rowVector[[i]] <- list(x = getState(sho)[1],
                               v = getState(sho)[2],
                               t = getState(sho)[3])
        solver <- step(solver)
        sho    <- getODE(solver)
        i <- i + 1
    }
    return(data.table::rbindlist(rowVector))
}

solution <- SHOApp()
plot(solution)





