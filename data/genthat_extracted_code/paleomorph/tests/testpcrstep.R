context('Test the pcrstep')

library(abind)

test_that('pcr step works in 2D with no missing data. 2 shapes', {

  # Align two squares
  sq1 <- rbind(c(1, 1, 0), c(1, -1, 0), c(-1, -1, 0), c(-1, 1, 0))
  sq2 <- rbind(c(0, sqrt(2), 0), c(sqrt(2), 0, 0), c(0, -sqrt(2), 0),  c(-sqrt(2), 0, 0))
  A <- abind(sq1, sq2, along = 3)


  A <- pcrstep(A, scaleDelta = FALSE)
  
  expect_equal(A[, , 1], A[, , 1])



  # Try with zero in a different plane
  # Align two squares
  sq1 <- rbind(c(1, 0, 1), c(1, 0, -1), c(-1, 0, -1), c(-1, 0, 1))
  sq2 <- rbind(c(0, 0, sqrt(2)), c(sqrt(2), 0, 0), c(0, 0, -sqrt(2)),  c(-sqrt(2), 0, 0))
  A <- abind(sq1, sq2, along = 3)


  A <- pcrstep(A, scaleDelta = FALSE)
  
  expect_equal(A[, , 1], A[, , 2])



  # Try with zero in third plane
  # Align two squares
  sq1 <- rbind(c(0,1,  1), c(0, 1, -1), c(0, -1, -1), c(0, -1, 1))
  sq2 <- rbind(c(0, 0, sqrt(2)), c( 0, sqrt(2),0), c(0, 0, -sqrt(2)),  c( 0, -sqrt(2),0))
  A <- abind(sq1, sq2, along = 3)


  A <- pcrstep(A, scaleDelta = FALSE)
  
  expect_equal(A[, , 1], A[, , 2])

})



test_that('pcr step works in 3D by rotating. 2 shapes', {

  set.seed(1)
  # Make a shape, then rotate it, then pcr it back
  sh1 <- matrix(sample(1:48), ncol =3)

  x <- runif(1, 0, 2*pi)
  y <- runif(1, 0, 2*pi)
  z <- runif(1, 0, 2*pi)

  R <- rbind(c(cos(x)*cos(y), -cos(z)*sin(y) + sin(z)*sin(x)*cos(y), sin(z)*sin(y) + cos(z)*sin(x)*cos(y)),
             c(cos(x)*sin(y), cos(z)*cos(y) + sin(z)*sin(x)*sin(y)  ,  -sin(z)*cos(y) + cos(z)*sin(x)*sin(y)  ),
             c(-sin(x), sin(z)*cos(x), cos(x)*cos(z)))
  

  sh2 <- t(apply(sh1, 1, function(x) t(x) %*% R))

  A <- abind(sh1, sh2, along = 3)


  A <- pcrstep(A, maxiter = 1000, scaleDelta = FALSE)
  
  expect_equal(A[, , 1], A[, , 2])



})


test_that('pcr step works in 3D with noise. 2 shapes', {

  set.seed(2)
  # Make a shape, then rotate it, then pcr it bake
  sh1 <- matrix(sample(1:48), ncol =3)
  sh2 <- matrix(sample(1:48), ncol =3)

  A <- abind(sh1, sh2, along = 3)


  B <- pcrstep(A, maxiter = 1000, scaleDelta = FALSE)
  
  expect_true(scorea(A, 2, 48 / 3) > scorea(B,  2, 48 / 3))

})


