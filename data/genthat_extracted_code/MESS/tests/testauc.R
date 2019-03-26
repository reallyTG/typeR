context("Test auc")


##
## All of these checks should provide the correct results
##

test_that("Produces validated results", {
    expect_equal(auc(1:4, c(0, 1, 1, 5)), 4.5)
    expect_equal(auc(1:4, -c(0, 1, 1, 5)), -4.5)
    expect_equal(auc(1:4, -c(0, 1, 1, 5), absolutearea=TRUE), 4.5)
    expect_equal(auc(0:4, c(0, 0, 1, -1, 0)), 0)
    expect_equal(auc(0:4, c(0, 0, 1, -1, 0), absolutearea=TRUE), 1.5)
    expect_equal(auc(0:4, c(0, 0, 1, -1, 0), from=0, rule=2, type="spline", yleft=.5), -0.214285, tolerance=0.00001)
})

