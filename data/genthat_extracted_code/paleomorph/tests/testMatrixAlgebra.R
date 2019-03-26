context('Test the smaller matrix algebra functions used.')



test_that('rp_decompose works.', {
 
  m <- matrix(1:4, nrow = 2, ncol = 2)

  rpdecomp <- rp_decompose(m)

  # Decomposition should recover original matrix
  expect_equal(m, rpdecomp$R %*% rpdecomp$P)
  
  # P is symmetric positive definite
  #   Currently dealing with some ambiguity in signs
  #   So for now make antidiagonal negative.
  #rpdecomp$P[1, 2] <- -abs(rpdecomp$P[1, 2])
  #rpdecomp$P[2, 1] <- -abs(rpdecomp$P[2, 1])

  
  pos <- rep(FALSE, ncol(rpdecomp$P))
  for(c in 1:ncol(rpdecomp$P)){
    if(all(rpdecomp$P[, c] == 0)){
      pos[c] <- TRUE
    } else {
      pos[c] <- t(rpdecomp$P[, c]) %*% rpdecomp$P %*% rpdecomp$P[, c] > 0
    }
  }
  expect_true(all(pos))



  # Same tests with another matrix just to have a better chance of catching something incorrect
  set.seed(1)
  m <- matrix(runif(25), ncol = 5)

  rpdecomp <- rp_decompose(m)

  # Decomposition should recover original matrix
  expect_equal(m, rpdecomp$R %*% rpdecomp$P)
  
  # P is symmetric positive definite
  #   Currently dealing with some ambiguity in signs
  #   So for now make antidiagonal negative.
  #rpdecomp$P[1, 2] <- -abs(rpdecomp$P[1, 2])
  #rpdecomp$P[2, 1] <- -abs(rpdecomp$P[2, 1])
 

  
  #expect_equal(rpdecomp$P, t(rpdecomp$P))

  pos <- rep(FALSE, ncol(rpdecomp$P))
  for(c in 1:ncol(rpdecomp$P)){
    if(all(rpdecomp$P[, c] == 0)){
      pos[c] <- TRUE
    } else {
      pos[c] <- t(rpdecomp$P[, c]) %*% rpdecomp$P %*% rpdecomp$P[, c] > 0
    }
  }
  expect_true(all(pos))

})



test_that('rp_decompose gives error with rectangular matrices.', {
 
  m <- matrix(1:8, nrow = 2, ncol = 4)
  
  expect_error(rp_decompose(m))

})



test_that('rpdecompose works with negative values.', {
 
  m <- matrix(-2:1, nrow = 2, ncol = 2)
  rpdecomp <- rp_decompose(m)

  expect_equal(m, rpdecomp$R %*% rpdecomp$P)


})
