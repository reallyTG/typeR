test_that("breakpoints for breaker function", {
  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  b = breaker(nim, zlim = c(-2, 2), col = hotmetal(5))
  expect_equal(b, c(-3.4980589839012, -2, 
                    -0.666666666666667, 0.666666666666667, 
                    2, 3.40187203166968))
  
  ###################################
  # zlim= NULL case
  ###################################
  b = breaker(nim, zlim = NULL, col = hotmetal(5))
  expect_equal(b, c(-3.4980589839012, -3.4980589839012, 
                    -1.19808197871091, 1.10189502647939, 
                    3.40187203166968, 3.40187203166968))  
  
  b = breaker(nim, zlim = NULL, col = "red")
  expect_equal(b, c(-3.4980589839012, 3.40187203166968))    

  ###################################
  # only one color
  ###################################
  b = breaker(nim, zlim = c(-2, 2), col = "red")
  expect_equal(b, c(-3.4980589839012, 3.40187203166968))  
  
  ###################################
  # one color with breaks in there
  ###################################
  b = breaker(nim, zlim = c(-2, 2), col = "red", breaks = c(2,3))
  expect_equal(b, c(2, 3))
  
  ###################################
  # one color one break
  ###################################
  b = breaker(nim, zlim = c(-2, 2), col = "red", breaks = c(2))
  expect_equal(b, c(2))
  
  ###################################
  # zero length color one break
  ###################################  
  b = breaker(nim, zlim = c(-2, 2), col = character(0), breaks = c(2))
  expect_equal(b, c(2))  
  
  b = breaker(nim, zlim = c(-2, 2), col = character(0), breaks = numeric(0 ))
  expect_equal(b, numeric(0))    
  
})