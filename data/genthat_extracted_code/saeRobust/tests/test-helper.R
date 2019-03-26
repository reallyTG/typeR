context("helper")
test_that("helper", {

    expectEqual <- function(a, b) {
        testthat::expect_equal(a, b)
    }

    ref <- 1
    attr(ref, "a") <- 1

    expectEqual(
        addAttr(1, 1, "a"),
        ref
    )

})
