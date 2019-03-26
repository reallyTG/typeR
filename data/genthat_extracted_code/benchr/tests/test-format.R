context("Format method")

b <- benchmark(1 + 1, times = 1L)

test_that("Attach correct 'units' attribute", {
    tmp <- convert_units(b, units = "us")
    expect_equal(attr(tmp, "units"), "us")
})

test_that("Conversion is correct", {
    tmp <- convert_units(b, units = "ms")
    expect_equal(tmp$time, b$time * 1e3)
})
