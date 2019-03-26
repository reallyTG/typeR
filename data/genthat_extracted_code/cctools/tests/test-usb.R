context("Uniform scaled beta (USB) distribution")
set.seed(5)
sq <- seq(-1, 1, by = 0.001)

test_that("Density integrates to one", {
    expect_equal(integrate(dusb, -1, 1)$value, 1)
    expect_equal(integrate(dusb, -1, 1, theta = 0.4)$value, 1)
    expect_equal(integrate(dusb, -1, 1, theta = 0.4, nu = 10)$value, 1)
})

test_that("Simulation works", {
    expect_lt(max(abs(rusb(500))), 0.5)
    expect_gt(max(abs(rusb(500))), 0.48)

    expect_lt(max(abs(rusb(500, theta = 0.2))), 0.6)
    expect_gt(max(abs(rusb(500, theta = 0.1))), 0.5)

    expect_lt(max(abs(rusb(500, theta = 0.99, nu = 10))), 1)
    expect_gt(max(abs(rusb(500, theta = 0.99, nu = 1))), 0.94)

    expect_lt(max(abs(rusb(500, quasi = TRUE))), 0.5)
    expect_gt(max(abs(rusb(500, quasi = TRUE))), 0.48)

    expect_lt(max(abs(rusb(500, quasi = TRUE, theta = 0.2))), 0.6)
    expect_gt(max(abs(rusb(500, quasi = TRUE, theta = 0.1))), 0.5)

    expect_lt(max(abs(rusb(500, quasi = TRUE, theta = 0.99, nu = 10))), 1)
    expect_gt(max(abs(rusb(500, quasi = TRUE, theta = 0.99, nu = 1))), 0.94)
})

