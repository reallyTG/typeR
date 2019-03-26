test_that("Test of sgmod", {
  mod <- sgmodel(grid = 100, states = 3, rho = 0.02, sigma = 0.02)
  expect_equal(300, length(mod$Savings))
})
