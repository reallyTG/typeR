library(testthat)

context("test Verlet")

# add a class example to test Verlet  ++++++++++++++++++++++++++++++++++++++++++
setClass("Kepler", slots = c(
    GM = "numeric",
    odeSolver = "Verlet",
    counter = "numeric"
    ),
    contains = c("ODE")
    )

setMethod("initialize", "Kepler", function(.Object, ...) {
    .Object@GM <- 4 * pi * pi         # gravitation constant times combined mass
    .Object@state <- vector("numeric", 5)  # x, vx, y, vy, t
    .Object@odeSolver <- Verlet(.Object)
    .Object@counter <- 0
    return(.Object)
})

setMethod("doStep", "Kepler", function(object, ...) {
    object@odeSolver <- step(object@odeSolver)
    object@state <- object@odeSolver@ode@state
    object
})

setMethod("getTime", "Kepler", function(object, ...) {
    return(object@state[5])
})

setMethod("getEnergy", "Kepler", function(object, ...) {
    ke <- 0.5 * (object@state[2] * object@state[2] +
                     object@state[4] * object@state[4])
    pe <- -object@GM / sqrt(object@state[1] * object@state[1] +
                                object@state[3] * object@state[3])
    return(pe+ke)
})

setMethod("init", "Kepler", function(object, initState, ...) {
    object@state <- initState
    object@odeSolver <- init(object@odeSolver, getStepSize(object@odeSolver))
    object@counter <- 0
    object
})

setMethod("getRate", "Kepler", function(object, state, ...) {
    # Computes the rate using the given state.
    r2 <- state[1] * state[1] + state[3] * state[3]  # distance squared
    r3 <- r2 * sqrt(r2)   # distance cubed
    object@rate[1] <- state[2]
    object@rate[2] <- (- object@GM * state[1]) / r3
    object@rate[3] <- state[4]
    object@rate[4] <- (- object@GM * state[3]) / r3
    object@rate[5] <- 1   # time derivative
    object@counter <- object@counter + 1
    object@rate

})

setMethod("getState", "Kepler", function(object, ...) {
    # Gets the state variables.
    return(object@state)
})

# constructor
Kepler <- function() {
    kepler <- new("Kepler")
    return(kepler)
}
# end of class example to test Verlet  +++++++++++++++++++++++++++++++++++++++++



# start of tests
# initial values
x   <- 1
vx  <- 0
y   <- 0
vy  <- 2 * pi
dt  <- 0.01
tol <- 1e-3

test_that("ODE enhanced object has been created", {
    particle <- Kepler()
    expect_equal(slotNames(particle), c("GM", "odeSolver", "counter", "state", "rate"))
    expect_equal(particle@state, c(0,0,0,0,0))
    expect_equal(getState(particle), c(0,0,0,0,0))
    expect_true(getTime(particle) == 0)
    expect_true(getEnergy(particle) == -Inf)
    expect_equal(getRate(particle, c(0,0,0,0,0)), c(0, NaN,   0, NaN,   1))
})



test_that("ODE object has been initialized", {
    particle <- Kepler()
    # state before
    expect_equal(particle@state, c(0, 0, 0, 0, 0))

    particle <- init(particle, c(x, vx, y, vy, 0))

    # state after
    expect_equal(particle@state, c(1, 0, 0, 6.283185, 0), tolerance = 1e-7)
})

test_that("Verlet object has been created", {
    particle <- Kepler()
    particle <- init(particle, c(x, vx, y, vy, 0))

    odeSolver <- Verlet(particle)

    expect_true(class(odeSolver) == "Verlet")
    expect_equal(slotNames(odeSolver),
    c("rate1", "rate2", "rateCounter", "stepSize", "numEqn", "ode")
    )
})


test_that("ODE solver has been initialized", {
    particle <- Kepler()
    particle <- init(particle, c(x, vx, y, vy, 0))
    odeSolver <- Verlet(particle)

    # stepSize
    expect_equal(particle@odeSolver@stepSize, 0.1)
    odeSolver <- init(odeSolver, dt)
    expect_equal(particle@odeSolver@stepSize, 0.1)

    # state before
    expect_equal(particle@state, c(1, 0, 0, 6.283185, 0), tolerance = 1e-7)
    expect_equal(particle@odeSolver@ode@state, c(0, 0, 0, 0, 0))
    particle@odeSolver <- odeSolver
    # state after
    expect_equal(particle@state, c(1, 0, 0, 6.283185, 0), tolerance = 1e-7)
    expect_equal(particle@odeSolver@ode@state, c(1, 0, 0, 6.283185, 0), tolerance = 1e-7)

})


test_that("Solver state has been copied to ODE object", {
    particle <- Kepler()
    particle <- init(particle, c(x, vx, y, vy, 0))
    odeSolver <- Verlet(particle)
    odeSolver <- init(odeSolver, dt)
    particle@odeSolver <- odeSolver

    expect_equal(slotNames(particle), c("GM", "odeSolver", "counter", "state", "rate"))
    expect_equal(particle@state, c(1.000000, 0.000000, 0.000000, 6.283185, 0.000000), tolerance = 1e-6)
    expect_equal(getRate(particle, c(0,0,0,0,0)), c(0, NaN,   0, NaN,   1))
})




test_that("ODE state advances one step", {
    particle <- Kepler()
    particle <- init(particle, c(x, vx, y, vy, 0))
    odeSolver <- Verlet(particle)
    odeSolver <- init(odeSolver, dt)
    particle@odeSolver <- odeSolver

    particle <- doStep(particle)

    expect_equal(particle@state,
             c(0.99802608, -0.39439339,  0.06283185,  6.27078287,  0.01000000),
             tolerance = 1e-6)
})



test_that("Object initial energy matches value", {
    particle <- Kepler()
    particle <- init(particle, c(x, vx, y, vy, 0))
    odeSolver <- Verlet(particle)
    odeSolver <- init(odeSolver, dt)
    particle@odeSolver <- odeSolver

    # before step
    expect_equal(c(getTime(particle),
                   getEnergy(particle),
        particle@state[1],
        particle@state[2],
        particle@state[3],
        particle@state[4],
        particle@state[5]
        ),
        c(0, -19.73918, 1, 0, 0, 6.283185, 0),
        tolerance = 1e-5)


    particle <- doStep(particle)
    initialEnergy <- getEnergy(particle)

    # after step
    expect_equal(c(getTime(particle),
                   getEnergy(particle),
                   particle@state[1],
                   particle@state[2],
                   particle@state[3],
                   particle@state[4],
                   particle@state[5]
                    ),
    c(0.01, -19.73918, 0.9980261, -0.3943934, 0.06283185, 6.270783, 0.01),
    tolerance = 1e-4)
})


test_that("Match expected values after solving", {
    particle <- Kepler()
    particle <- init(particle, c(x, vx, y, vy, 0))
    odeSolver <- Verlet(particle)
    odeSolver <- init(odeSolver, dt)
    particle@odeSolver <- odeSolver
    particle <- doStep(particle)
    initialEnergy <- getEnergy(particle)

    i <- 0
    while (getTime(particle) <= 1.20) {
        particle <- doStep(particle)
        energy <- getEnergy(particle)
        # cat(sprintf("time=%12f energy=%12f state[5]=%12f \n",
        #             getTime(particle), energy, particle@state[5]))
        i <- i + 1
    }

    expect_equal((c(getTime(particle), energy,
                    particle@state[1],
                    particle@state[2],
                    particle@state[3],
                    particle@state[4],
                    particle@state[5])),
    c(1.2, -19.73918, 0.3168587, -5.953966, 0.9491895, 1.993771, 1.2),
    tolerance = 1e-6
    )
})
