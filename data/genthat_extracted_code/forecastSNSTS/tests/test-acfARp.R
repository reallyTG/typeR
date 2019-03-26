context("acfARp")

# In this file we test the acfARp function

test_that("acfARp works for white noise", {
  
  expect_equal(acfARp(NULL, sigma=1, k=0), 1)
  expect_equal(acfARp(NULL, sigma=2, k=0), 4)
  expect_equal(acfARp(NULL, sigma=1, k=1), 0)
  expect_equal(acfARp(NULL, sigma=2, k=1), 0)
  expect_equal(acfARp(NULL, sigma=2, k=-2), 0)

})

test_that("acfARp works for some AR(1)", {
      
  expect_equal(acfARp(-.5, sigma = 1, k = 0),  1/(1-(-.5)^2))
  expect_equal(acfARp(-.5, sigma = 2, k = 0),  4/(1-(-.5)^2))
  expect_equal(acfARp(-.5, sigma = 1, k = 1),  -.5/(1-(-.5)^2))
  expect_equal(acfARp(-.5, sigma = 2, k = 1),  -2/(1-(-.5)^2))
  expect_equal(acfARp(-.5, sigma = 2, k = -1), -2/(1-(-.5)^2))
  expect_equal(acfARp(.5, sigma = 2, k = -1),  2/(1-(.5)^2))
  
})

test_that("acfARp works a specific AR(2)", {
      
      a1 <- 1/3
      a2 <- 2/9
      
      acorr <- function(k) {
        return( (16/21)*(2/3)^abs(k) + (5/21)*(-1/3)^abs(k) )
      }
      
      v <- ((1-a2)/(1+a2)) / ( (1-a2)^2 - a1^2 )

      expect_equal(acfARp(c(a1, a2), sigma = 1, k = 0),  v*acorr(0))
      expect_equal(acfARp(c(a1, a2), sigma = 1, k = 1),  v*acorr(1))
      expect_equal(acfARp(c(a1, a2), sigma = 1, k = -2), v*acorr(-2))
      
    })

test_that("parameter validation works properly", {
  # a not a vector
  expect_error( acfARp(a = "not a vector", 1, 0) )
  # unit root
  expect_error( acfARp(a = c(1), 1, 0) )
  # root larger than one
  expect_error( acfARp(a = c(2), 1, 0) )
  # sigma not a number
  expect_error( acfARp(a = c(-.5), "not a number", 0) )
  # sigma <= 0
  expect_error( acfARp(a = c(-.5), 0, 0) )
  expect_error( acfARp(a = c(-.5), -1, 0) )
  # k not an integer
  expect_error( acfARp(a = c(-.5), 1, "not an integer") )
  expect_error( acfARp(a = c(-.5), 1, 0.5) )
})