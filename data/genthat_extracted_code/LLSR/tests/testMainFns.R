library(LLSR)
options(digits = 14)

test_that("Mechuk's Coefficients", {
  expect_equal(summary(AQSys(llsr_data$db.data[6:23,1:2], modelName = "merchuk"))$coefficients[1], 42.474492579386, tolerance = 1e-7)
  expect_equal(summary(AQSys(llsr_data$db.data[6:23,1:2], modelName = "merchuk"))$coefficients[2], -0.22650605259699, tolerance = 1e-7)
  expect_equal(summary(AQSys(llsr_data$db.data[6:23,1:2], modelName = "merchuk"))$coefficients[3], 1.4832637124294e-05, tolerance = 1e-7)
})

test_that("Murugesan's Coefficients", {
  expect_equal(summary(AQSys(llsr_data$db.data[6:23,1:2], modelName = "murugesan"))$coefficients[1], 37.738759239178, tolerance=1e-7)
  expect_equal(summary(AQSys(llsr_data$db.data[6:23,1:2], modelName = "murugesan"))$coefficients[2], -5.56344729455, tolerance=1e-7)
  expect_equal(summary(AQSys(llsr_data$db.data[6:23,1:2], modelName = "murugesan"))$coefficients[3], 0.036141267637225, tolerance=1e-7)
})

# AQSys.gsnchk(peg4kslt[1:2],peg4kslt[2,3],peg4kslt[2,4],peg4kslt[2,5],
# peg4kslt[2,6],peg4kslt[2,7],peg4kslt[2,8])
