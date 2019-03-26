library(easyVerification)
context('Out-of-sample reference forecasts')

test_that("Error handling", {
  expect_error(indRef(1.3))
  expect_error(indRef(1, type='crossval'))
  expect_error(indRef(10, type='block', indices=1))
  expect_error(indRef(10, type='forward', indices=1))
  expect_error(indRef(1, type='block', blocklength=11))
  expect_error(generateRef(rnorm(3), indRef(10)))
  expect_error(generateRef(rnorm(3), indRef(10, indices=3:5)))
})

test_that("Number of forecasts in reference indices", {
  expect_equal(length(indRef(5)), 5)
  expect_equal(length(indRef(5, indices=1:4)), 5)
  expect_equal(length(indRef(5, indices=1:10)), 5)
  expect_equal(length(indRef(5, type='forward', indices=1:4)), 5)
  expect_equal(length(indRef(5, type='forward', indices=1:10)), 5)
  expect_equal(length(indRef(5, type='crossval', indices=1:4)), 5)
  expect_equal(length(indRef(5, type='crossval', indices=1:10)), 5)
  expect_equal(length(indRef(5, type='block', indices=1:4)), 5)
  expect_equal(length(indRef(5, type='block', indices=1:10)), 5)
})

test_that("Reference indices", {
  expect_equal(indRef(5, indices=2:4), lapply(1:5, function(x) 2:4))
  expect_equal(indRef(3, type='forward'), list(2:3, 1, 1:2))
  expect_equal(indRef(3, type='crossval'), list(2:3, c(1,3), 1:2))
  expect_equal(indRef(3, type='crossval', indices=1:5),
               list(2:5, c(1, 3:5), c(1:2, 4:5)))
  expect_equal(indRef(3, type='crossval', indices=4:6), 
               lapply(1:3, function(x) 4:6))
  expect_equal(indRef(4, type='block', indices=1:5, blocklength=2), 
               list(3:5, 3:5, c(1:2,5), c(1:2,5)))
  expect_equal(indRef(5, type='crossval'), indRef(5, type='block'))
})

test_that("Reference forecasts", {
  expect_equal(generateRef(paste0('f', 1:3), indRef(1, indices=1:3)),
               t(as.matrix(paste0('f', 1:3))))
  expect_equal(generateRef(paste0('f', 1:3), indRef(2, indices=1:3)),
               t(array(paste0('f', 1:3), c(3, 2))))
  expect_equal(generateRef(1:3, indRef(3, type='forward')),
               matrix(c(2,3,1,NA,1,2), 3, 2, byrow=TRUE))  
  expect_equal(generateRef(1:3, indRef(3, type='crossval')),
               matrix(c(2,3,1,3,1,2), 3, 2, byrow=TRUE))  
  expect_equal(generateRef(1:3, indRef(3, type='crossval', blocklength=2)),
               matrix(c(2,3,3,NA,1,NA), 3, 2, byrow=TRUE))  
})

