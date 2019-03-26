context("Testing generation of VARs")

test_that("sparsevar", {
  sim <- sparsevar::simulateVAR(N = 20, p = 2)
  expect_output(str(sim), "List of 4")
  expect_output(cat(attr(sim, "class")), "var")
  expect_output(cat(attr(sim, "type")), "simulation")
})

context("Testing estimation of VARs")

test_that("sparsevar", {
  sim <- sparsevar::simulateVAR(N = 30, p = 1)
  fit <- sparsevar::fitVAR(sim$series, p = 1)
  expect_output(str(fit), "List of 11")
  expect_output(cat(attr(fit, "class")), "var")
  expect_output(cat(attr(fit, "type")), "fit")
})

context("Testing IRF and error bands")

test_that("sparsevar", {
  sim <- sparsevar::simulateVAR(N = 10, p = 3)
  fit <- sparsevar::fitVAR(sim$series, p = 3)
  irf <- sparsevar::impulseResponse(fit, len = 20)
  expect_output(str(irf), "List of 3")
  expect_output(cat(attr(irf, "class")), "irf")
  eb <- sparsevar::errorBandsIRF(fit, irf, verbose = FALSE)
  expect_output(str(eb), "List of 8")
  expect_output(cat(attr(eb, "class")), "irfBands")
})
