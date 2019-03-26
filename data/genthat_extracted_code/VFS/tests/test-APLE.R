context("Check APLE output.")
library(VFS)

# compare APLE output to original Vadas spreadsheet


# single APLE run
x <- APLE(soilP = 127, clay = 17, OM = 6, precip = 35, runoff = 6, erosion = 7, manureP = 25, manureSolids = 25, manureWEP = 50, manureIn = 40, fertP = 10, fertIn = 40)

test_that("single APLE values are correct", {
    expect_equal(round(x$lossErosion, 3), 22.322)
    expect_equal(round(x$lossDissolvedSoil, 3), 0.484)
    expect_equal(round(x$lossDissolvedManure, 3), 0.994)
    expect_equal(round(x$lossDissolvedFert, 3), 0.063)
    expect_equal(round(x$lossTotal, 3), 23.863)
})

# vectorized APLE run

x <- APLE(soilP = c(175, 101, 49, 122), clay = c(11, 41, 18, 12), OM = c(1, 5, 1, 6), precip = 35, runoff = c(7, 3, 3, 4), erosion = c(8, 6, 4, 1), manureP = 25, manureSolids = 25, manureWEP = 50, manureIn = 40, fertP = 10, fertIn = 40)

test_that("vectorized APLE values are correct", {
    expect_equal(round(x$lossErosion, 3), c(16.228, 18.676, 3.587, 3.806))
    expect_equal(round(x$lossDissolvedSoil, 3), c(0.778, 0.192, 0.093, 0.310))
    expect_equal(round(x$lossDissolvedManure, 3), c(1.201, 0.425, 0.425, 0.605))
    expect_equal(round(x$lossDissolvedFert, 3), c(0.081, 0.023, 0.023, 0.034))
    expect_equal(round(x$lossTotal, 3), c(18.287, 19.317, 4.129, 4.755))
})

