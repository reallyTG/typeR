context('scorea')

test_that('scorea works', {

  library(abind)

  # Does this function correctly calculate sums of squares.
  # Test for three specimens, two landmarks.
  # each point (x, y, z) is x = y = z e.g. (1,1,1) or (2,2,2)
  arr <- array( rep(1:6, 3), dim = c(3, 2, 3))

  arr <- aperm(arr, perm = c(2, 3, 1))

  m <- 3
  n <- 2

  # Test that the matrix I made conforms to what I said.
  #  i.e. each point (x, y, z) is x = y = z e.g. (1,1,1) or (2,2,2)
  expect_true(all(apply(arr, c(1, 3), function(x) length(unique(x)) == 1)))

  # Test that the sums of squares is correct.
  #   Each landmark between specimens are +1 on all dims
  #   (x, x, x) and (x+1, x+1, x+1)
  # So our sum of squares is 

  dist12 <- sum((c(1,1,1) - c(2,2,2)) %*% (c(1,1,1) - c(2,2,2)), (c(4,4,4) - c(5,5,5)) %*% (c(4,4,4) - c(5,5,5)))
  dist13 <- sum((c(1,1,1) - c(3,3,3)) %*% (c(1,1,1) - c(3,3,3)), (c(4,4,4) - c(6,6,6)) %*% (c(4,4,4) - c(6,6,6)))
  dist23 <- sum((c(2,2,2) - c(3,3,3)) %*% (c(2,2,2) - c(3,3,3)), (c(5,5,5) - c(6,6,6)) %*% (c(5,5,5) - c(6,6,6)))

  trueResult <- sum(dist12, dist13, dist23)
  
  expect_equal(scorea(arr, m, n), trueResult)

})



test_that('scorea works with only two specimens', {
  # Does this function correctly calculate sums of squares.
  # Test for two specimens, four landmarks.
  # each point (x, y, z) is x = y = z e.g. (1,1,1) or (2,2,2)
  arr <- array( rep(1:8, 3), dim = c(2, 4, 3))
  arr <- aperm(arr, perm = c(2, 3, 1))
  m <- 2
  n <- 4

  # Test that the matrix I made conforms to what I said.
  #  i.e. each point (x, y, z) is x = y = z e.g. (1,1,1) or (2,2,2)
  expect_true(all(apply(arr, c(1, 3), function(x) length(unique(x)) == 1)))

  # Test that the sums of squares is correct.
  #   Each landmark between specimens are +1 on all dims
  #   (x, x, x) and (x+1, x+1, x+1)
  # So our sum of squares is 
  trueResult <- sum((c(1,1,1) - c(2,2,2)) %*% (c(1,1,1) - c(2,2,2)),
                    (c(3,3,3) - c(4,4,4)) %*% (c(3,3,3) - c(4,4,4)),
                    (c(5,5,5) - c(6,6,6)) %*% (c(5,5,5) - c(6,6,6)),
                    (c(7,7,7) - c(8,8,8)) %*% (c(7,7,7) - c(8,8,8)))
  
  expect_equal(scorea(arr, m, n), trueResult)


})


test_that('scorea works with identical shapes', {
  # Does this function correctly calculate sums of squares.
  # Test for two specimens, four landmarks.
  # each point (x, y, z) is x = y = z e.g. (1,1,1) or (2,2,2)
  arr <- array( rep(2, 3*8), dim = c(2, 4, 3))
  arr <- aperm(arr, perm = c(2, 3, 1))
  m <- 2
  n <- 4

  # Test that the sums of squares is correct.
  #   Each landmark between specimens are +1 on all dims
  #   (x, x, x) and (x+1, x+1, x+1)
  # So our sum of squares is 
  trueResult <- 0
  
  expect_equal(scorea(arr, m, n), trueResult)

})


