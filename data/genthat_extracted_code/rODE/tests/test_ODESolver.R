library(testthat)
context("test ODESolver")


test_that("ODESolver cannot be instantiated because it is virtual", {
    res <- getClass("ODESolver")
    expect_true(res@virtual)
    expect_error(new("ODESolver"), "trying to generate an object from a virtual class")
})


test_that("ODESolver has methods implemented", {
    # # get the method printout
    # mtext <-  showMethods(class="ODESolver", printTo = FALSE )
    #
    # # extract only what is between "Function :" and " (pack ... .GlobalEnv)"
    # fvec  <- gsub( "Function(\\:\\s|\\s\\\")(.+)(\\s\\(|\\\")(.+$)",
    #               "\\2", mtext[grep("^Function", mtext)] )
    #
    # # vector comparison of methods
    expect_equal(showMethods2("ODESolver"),
                 c("getODE", "getStepSize", "init", "setStepSize", "step"))
})


test_that("AbstractSolver is an instance of ODESolver", {
    # build a class out of ODESolver
    setClass("AbstractSolver", slots = c(
        stepSize = "numeric",
        numEqn   = "numeric",
        ode = "ODE"
    ),
    contains = c("ODESolver")
    )
    AbstractSolver <- new("AbstractSolver")
    expect_true(is(AbstractSolver, "ODESolver"))
})

test_that("AbstractSolver is a class", {
    # build a class out of ODESolver
    setClass("AbstractSolver", slots = c(
        stepSize = "numeric",
        numEqn   = "numeric",
        ode = "ODE"
    ),
    contains = c("ODESolver")
    )
    AbstractSolver <- new("AbstractSolver")
    expect_true(class(AbstractSolver) == "AbstractSolver")
})

test_that("AbstractSolver has the correct slots", {
    # build a class out of ODESolver
    setClass("AbstractSolver", slots = c(
        stepSize = "numeric",
        numEqn   = "numeric",
        ode = "ODE"
    ),
    contains = c("ODESolver")
    )
    AbstractSolver <- new("AbstractSolver")
    expect_equal(slotNames("AbstractSolver"), c("stepSize", "numEqn",   "ode" ))
})
