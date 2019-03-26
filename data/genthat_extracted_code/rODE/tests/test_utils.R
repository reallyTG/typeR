library(testthat)

context("test utils")

test_that("Class AbstractODESolver has the correct methods", {
# print(showMethods2("AbstractODESolver"))
    expect_true(all(showMethods2("AbstractODESolver") %in%
             c("getStepSize", "init", "setStepSize", "step", "initialize", "init<-", "getODE")))
})

test_that("Class ODE has the correct methods", {
    # print(showMethods2("ODE"))
    expect_true(all(showMethods2("ODE") %in%
                    c("AbstractODESolver", "DormandPrince45",
                      "Euler", "EulerRichardson",
                      "getRate", "getState", "RK4", "Verlet", "initialize")))
})


test_that("application examples in rODE match", {
    # list all R scripts under inst/examples that end in "App"
    examples <- get_list_examples(aPackage = "rODE")

    expected <- c("AdaptiveStepApp.R", "ComparisonRK45App.R", "ComparisonRK45ODEApp.R",
                  "FallingParticleODEApp.R", "KeplerApp.R", "KeplerDormandPrince45App.R",
    "KeplerEnergyApp.R", "KeplerEulerApp.R", "LogisticApp.R", "PendulumApp.R",
    "PendulumEulerApp.R", "PendulumRK4App.R", "PlanetApp.R", "ProjectileApp.R",
    "ReactionApp.R", "RigidBodyNXFApp.R", "SHOApp.R", "SpringRK4App.R",
    "VanderpolApp.R", "VanderpolMuTimeControlApp.R")

    expect_equal(examples, expected)
})
