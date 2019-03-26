# -----------------------------------------------------------------------------
context("summarizeByPolygon()")

testthat::test_that("summarizeByPolygon properly summarizes", {
  testthat::expect_equal(
    dim(summarizeByPolygon(longitude = c(20.383333, -110, 25.433333, 11.330556, 101.766667, -110, -110),
                           latitude = c(36.066667, 71, 36.416667, 43.318611, 36.633333, 71, 71),
                           value = c(80, 43, 29, 55, 12, 32, 23),
                           SPDF = SimpleCountries, useBuffering = FALSE,
                           FUN = mean, varName="valueMean")), 
    c(nrow(SimpleCountries@data),2))
})
