context("price_deflate tests")


test_that("Using viable parameters works", {
  expect_type(price_deflate(1000, "ip", 2014, 2010), "double")
  expect_type(price_deflate(1000, "op", 2014, 2007), "double")
  })

test_that("Using a wrong year, or a non-year, is an error", {
  expect_error(price_deflate(1000, "ip", 2014, 2001))
  expect_error(price_deflate(1000, "ip", 2016, 2010))
  expect_error(price_deflate(1000, "ip", "thisyear", 2010))
})


test_that("Trying the wrong sector is an error", {
  expect_error(price_deflate(1000, "inpatient", 2014, 2008))
  expect_error(price_deflate(1000, "outpatient", 2014, 2010))
  expect_error(price_deflate(1000, 2002, 2012, 2010))
})
