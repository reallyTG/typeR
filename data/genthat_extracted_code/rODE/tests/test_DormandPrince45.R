library(testthat)
context("test DormandPrince45")

test_that("ODE solver core is OK", {
    DormandPrince45 <- function(ode) {
        new("DormandPrince45", ode)
    }

    ode = new("ODE")
    solver <- DormandPrince45(ode)
    expect_true(class(solver) == "DormandPrince45")

    # check if slots match
    expect_equal(slotNames(solver),
    c("error_code",                 "a",                         "b5",
       "er",                        "numStages",                 "stepSize",
       "numEqn",                    "temp_state",                "k",
       "truncErr",                  "ode",                       "tol",
       "enableExceptions",          "NO_ERROR",                  "DID_NOT_CONVERGE",
       "BISECTION_EVENT_NOT_FOUND")
    )
    # check default values
    expect_equal(c( solver@numStages,
                    solver@stepSize,
                    solver@numEqn,
                    solver@tol,
                    solver@enableExceptions),
                    c(6, 0.01, 0, 1e-06, FALSE)
                    )
    # array `a`
    expect_equal(solver@a ,
                 rbind( c(1.0/5.0, 0, 0, 0, 0),
                        c(3.0/40.0, 9.0/40.0, 0, 0, 0),
                        c(3.0/10.0, -9.0/10.0, 6.0/5.0, 0, 0),
                        c(226.0/729.0, -25.0/27.0, 880.0/729.0, 55.0/729.0, 0),
                        c(-181.0/270.0, 5.0/2.0, -266.0/297.0, -91.0/27.0, 189.0/55.0)))
    # array `b5`
    expect_equal(solver@b5,
                 c(19.0/216.0, 0.0, 1000.0/2079.0, -125.0/216.0, 81.0/88.0, 5.0/56.0)
    )
    # array `er`
    expect_equal(solver@er,
                 c(-11.0/360.0, 0.0, 10.0/63.0, -55.0/72.0, 27.0/40.0, -11.0/280.0)
    )

})

# test_that("after before/after init values match", {
    DormandPrince45 <- function(ode) {
        new("DormandPrince45", ode)
    }
    ode = new("ODE")
    solver <- DormandPrince45(ode)
    expect_true(class(solver) == "DormandPrince45")
    # state and rate have zero lengths BEFORE init
    expect_equal(length(solver@ode@state), 0)
    expect_equal(length(solver@ode@rate), 0)
    dt <- 0.01
    state <- c(2.00, 0.00, 0.00, 0.25, 0.00)
    solver@ode@state <- state

    solver <- init(solver, dt)

    # test after setting the state
    expect_equal(getState(solver@ode),  c(2.00, 0.00, 0.00, 0.25, 0.00))

    expect_is(getState(solver@ode), "numeric")
    expect_is(getRate(solver@ode, state), "numeric")

    expect_equal(getStepSize(solver), 0.01)

    expect_equal(getStepSize(solver), 0.01)
    expect_equal(getTolerance(solver), 1e-6)
    expect_equal(getErrorCode(solver), solver@NO_ERROR)
    expect_equal(solver@DID_NOT_CONVERGE, 1)
    expect_equal(solver@BISECTION_EVENT_NOT_FOUND, 2)

# })
