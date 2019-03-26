library(rODE)


### Name: doStep
### Title: doStep
### Aliases: doStep

### ** Examples

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++  example: PlanetApp.R
# Simulation of Earth orbiting around the SUn using the Euler ODE solver

importFromExamples("Planet.R")      # source the class

PlanetApp <- function(verbose = FALSE) {
    # x =  1, AU or Astronomical Units. Length of semimajor axis or the orbit
    # of the Earth around the Sun.
    x <- 1; vx <- 0; y <- 0; vy <- 6.28; t <- 0
    state <- c(x, vx, y, vy, t)
    dt <-  0.01
    planet <- Planet()
    planet@odeSolver <- setStepSize(planet@odeSolver, dt)
    planet <- init(planet, initState = state)
    rowvec <- vector("list")
    i <- 1
    # run infinite loop. stop with ESCAPE.
    while (getState(planet)[5] <= 90) {     # Earth orbit is 365 days around the sun
        rowvec[[i]] <- list(t  = getState(planet)[5],     # just doing 3 months
                            x  = getState(planet)[1],     # to speed up for CRAN
                            vx = getState(planet)[2],
                            y  = getState(planet)[3],
                            vy = getState(planet)[4])
        for (j in 1:5) {                 # advances time
            planet <- doStep(planet)
        }
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowvec)
    return(DT)
}
# run the application
solution <- PlanetApp()
select_rows <- seq(1, nrow(solution), 10)      # do not overplot
solution <- solution[select_rows,]
plot(solution)

# +++++++++++++++++++++++++++++++++++++++++++++++++++   application:  Logistic.R
# Simulates the logistic equation
importFromExamples("Logistic.R")

# Run the application
LogisticApp <- function(verbose = FALSE) {
    x  <- 0.1
    vx <- 0
    r  <- 2        # Malthusian parameter (rate of maximum population growth)
    K  <- 10.0     # carrying capacity of the environment
    dt   <- 0.01; tol  <- 1e-3; tmax <- 10

    population <- Logistic()                # create a Logistic ODE object

    # Two ways of initializing the object
      # population <- init(population, c(x, vx, 0), r, K)
    init(population) <-  list(initState = c(x, vx, 0),
                              r = r,
                              K = K)

    odeSolver <- Verlet(population)        # select the solver

    # Two ways of initializing the solver
      # odeSolver <- init(odeSolver, dt)
    init(odeSolver) <-  dt

    population@odeSolver <- odeSolver
    # setSolver(population) <-  odeSolver

    rowVector <- vector("list")
    i <- 1
    while (getTime(population) <= tmax) {
        rowVector[[i]] <- list(t = getTime(population),
                               s1 = getState(population)[1],
                               s2 = getState(population)[2])
        population <- doStep(population)
        i <- i + 1
    }
    DT <- data.table::rbindlist(rowVector)
    return(DT)
}
# show solution
solution <- LogisticApp()
plot(solution)



