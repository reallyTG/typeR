library(geoSpectral)
library(testthat)

sptest = spc.example_spectra()
sptest@header = SpcHeaderAdd(sptest@header, sptest@ShortName, 10)
test_that("SpcHeaderAdd adds headers correctly", {
  expect_equal(sptest@header$a_nap, 10)
})
