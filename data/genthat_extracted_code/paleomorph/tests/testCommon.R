context('Test smaller utility functions.')



test_that('lcentroid works.', {

  # Define array as 8 points of a cube around (0, 0, 0)
  A <- matrix(1, nrow = 8, ncol = 3)
  minusOnes <- data.frame(row = c(2, 3, 4, 5, 5, 6, 6, 7, 7, 8, 8, 8),
                          col = c(1, 2, 3, 1, 2, 1, 3, 2, 3, 1, 2, 3))
  for(i in 1:nrow(minusOnes)){
    A[minusOnes[i, 1], minusOnes[i, 2]] <- -1
  }
  
  expect_equal(lcentroid(A), c(0, 0, 0))

})

test_that('lcentroid catches missing data.', {
  
  A <- matrix(1, nrow = 8, ncol = 3)
  A[1,1] <- NA

  expect_error(lcentroid(A))
})



test_that('lcentroid2 does not error when given missing data.', {


  A <- matrix(1, nrow = 8, ncol = 3)
  A[1,1] <- NA

  expect_error(lcentroid2(A), regexp = NA)
})



test_that('lcentroid2 works.', {

  # Define array as 8 points of a cube around (0, 0, 0)
  A <- matrix(1, nrow = 8, ncol = 3)
  minusOnes <- data.frame(row = c(2, 3, 4, 5, 5, 6, 6, 7, 7, 8, 8, 8),
                          col = c(1, 2, 3, 1, 2, 1, 3, 2, 3, 1, 2, 3))
  for(i in 1:nrow(minusOnes)){
    A[minusOnes[i, 1], minusOnes[i, 2]] <- -1
  }
  
  expect_equal(lcentroid2(A), c(0, 0, 0))

  # Now tests it still works properly with missing data
  A2 <- rbind(A, c(1, 2, NA))
  expect_equal(lcentroid2(A2), c(0, 0, 0))

})






test_that('lrotate works', {

  # rotate single points
  A <- matrix(0, ncol = 3, nrow = 3)
  diag(A) <- 1

  # Rotate all by 180. Should make easy suite of tests.
  Rx <- rbind(c(1, 0, 0), c(0, -1, 0), c(0, 0, -1))
  # Rotate AROUND x axis, so only x (row 1) should remain same.
  #   Others are flipped by 180 i.e. 1 -> -1
  expect_equal(lrotate(A, Rx)[-1, ], -A[-1, ]) 
  expect_equal(lrotate(A, Rx)[1, ], A[1, ]) 


  Ry <- rbind(c(-1, 0, 0), c(0, 1, 0), c(0, 0, -1))
  # Rotate AROUND y axis, so only y (row 2) should remain same.
  #   Others are flipped by 180 i.e. 1 -> -1
  expect_equal(lrotate(A, Ry)[-2, ], -A[-2, ]) 
  expect_equal(lrotate(A, Ry)[2, ], A[2, ]) 

  Rz <- rbind(c(-1, 0, 0), c(0, -1, 0), c(0, 0, 1))
  # Rotate AROUND z axis, so only z (row 3) should remain same.
  #   Others are flipped by 180 i.e. 1 -> -1
  expect_equal(lrotate(A, Rz)[-3, ], -A[-3, ]) 
  expect_equal(lrotate(A, Rz)[3, ], A[3, ]) 


})



test_that('lrotate rotates complete rows and ignores missing data rows',  {


  # rotate single points
  A <- matrix(0, ncol = 3, nrow = 3)
  diag(A) <- 1
  A <- rbind(A, c(1, NA, 3))

  # Rotate all by 180. Should make easy suite of tests.
  #  Row 4 (with NA) should be unchanged.
  Rx <- rbind(c(1, 0, 0), c(0, -1, 0), c(0, 0, -1))
  # Rotate AROUND x axis, so only x (row 1) should remain same.
  #   Others are flipped by 180 i.e. 1 -> -1
  expect_equal(lrotate(A, Rx)[-c(1, 4), ], -A[-c(1, 4), ]) 
  expect_equal(lrotate(A, Rx)[c(1, 4), ], A[c(1, 4), ]) 


  Ry <- rbind(c(-1, 0, 0), c(0, 1, 0), c(0, 0, -1))
  # Rotate AROUND y axis, so only y (row 2) should remain same.
  #   Others are flipped by 180 i.e. 1 -> -1
  expect_equal(lrotate(A, Ry)[-c(2, 4), ], -A[-c(2, 4), ]) 
  expect_equal(lrotate(A, Ry)[c(2, 4), ], A[c(2, 4), ]) 

  Rz <- rbind(c(-1, 0, 0), c(0, -1, 0), c(0, 0, 1))
  # Rotate AROUND z axis, so only z (row 3) should remain same.
  #   Others are flipped by 180 i.e. 1 -> -1
  expect_equal(lrotate(A, Rz)[-c(3, 4), ], -A[-c(3, 4), ]) 
  expect_equal(lrotate(A, Rz)[c(3, 4), ], A[c(3, 4), ]) 

})


test_that('lshift works.', {

  A <- matrix(1:6, nrow = 2, byrow = TRUE)

  l <- -(1:3)
  
  newA <- lshift(A, l)
  
  expect_equal(newA[1,], c(0, 0, 0))
  expect_equal(newA[2,], c(3, 3, 3))

  # Check works with positive numbers
  
  l <- c(1, 1, 1)
  newA2 <- lshift(A, l)

  expect_equal(newA2, matrix(2:7, nrow = 2, byrow = TRUE))
  


  # Check works with all zeros
  l <- c(0, 0, 0)
  newA3 <- lshift(A, l)

  expect_equal(A, newA3)

})




test_that('lnorm works.', {

  A <- matrix(1:6, nrow = 2, byrow = TRUE)

  a2 <- lnorm(A)

  expect_equal(a2, sum((1:6)^2))

})



test_that('lnorm works with missing data.', {

  A <- matrix(1:6, nrow = 2, byrow = TRUE)
  A <- rbind(A, c(NA, 2, 2))

  a2 <- lnorm(A)

  expect_equal(a2, sum((1:6)^2))

})




test_that('lscale works.', {

  A <- matrix(1:6, nrow = 2, byrow = TRUE)

  l <- c(1, 1, 2)
  
  newA <- lscale(A, l)
  
  expect_equal(newA[, 1:2], A[, 1:2])
  expect_equal(newA[, 3], A[, 3]*2)

  # Check works with positive numbers
  


  # Check works with all ones
  l <- c(1, 1, 1)
  newA2 <- lscale(A, l)

  expect_equal(A, newA2)


  # Check works with all zeros
  l <- c(0, 0, 0)
  newA3 <- lscale(A, l)

  expect_equal(newA3, matrix(0, nrow = 2, ncol = 3))




  # Check works with missing data
  A <- rbind(A, c(NA, 2, 3))
  l <- c(0, 0, 0)
  newA4 <- lscale(A, l)

  expect_equal(A[3, ], newA4[3, ])
  expect_equal(newA4[1:2, ], matrix(0, nrow = 2, ncol = 3))

})




