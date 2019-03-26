library(testthat)
context("test ODEAdaptiveSolver")

solver <- new("ODEAdaptiveSolver")

test_that("ODEAdaptiveSolver instance is right", {
    expect_equal(slotNames(solver), c("NO_ERROR", "DID_NOT_CONVERGE", "BISECTION_EVENT_NOT_FOUND"))

    # print(showMethods2("ODEAdaptiveSolver"))
    expect_true(all(showMethods2("ODEAdaptiveSolver") %in%
                 c("getErrorCode", "getTolerance", "setTolerance", "initialize", "setTolerance<-")))

    expect_true(all(showMethods2("ODEAdaptiveSolver") %in%
                    c("getErrorCode", "getTolerance", "initialize", "setTolerance", "setTolerance<-")))


    expect_equal(c(solver@NO_ERROR,
                   solver@DID_NOT_CONVERGE,
                   solver@BISECTION_EVENT_NOT_FOUND),
                 c(0,1,2))
})
