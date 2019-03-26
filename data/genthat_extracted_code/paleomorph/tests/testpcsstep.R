context('Test that the pcsstep works.')

library(abind)



test_that('pcs step works in 2D with no missing data. 2 shapes', {

  # Align two squares
  sq1 <- rbind(c(1, 1, 0), c(1, -1, 0), c(-1, -1, 0), c(-1, 1, 0))
  sq2 <- rbind(c(2, 2, 0), c(2, -2, 0), c(-2, -2, 0), c(-2, 2, 0))
  A <- abind(sq1, sq2, along = 3)


  A <- pcsstep(A, scaleDelta = FALSE)
  
  expect_equal(A[, , 1], A[, , 2])

})




test_that('pcs step works in 3D with no missing data. 2 shapes', {

  # Align two squares
  cube1 <- rbind(c(1, 1, 1), c(1, -1, 1), c(-1, -1, 1), c(-1, 1, 1), c(1, 1, -1), c(1, -1, -1), c(-1, -1, -1), c(-1, 1, -1))
  cube2 <- rbind(c(2, 2, 2), c(2, -2, 2), c(-2, -2, 2), c(-2, 2, 2), c(2, 2, -2), c(2, -2, -2), c(-2, -2, -2), c(-2, 2, -2))
  A <- abind(cube1, cube2, along = 3)


  A <- pcsstep(A, scaleDelta = FALSE)
  
  expect_equal(A[, , 1], A[, , 2])

})


test_that('pcs step works in 3D with no missing data. 2 shapes. Smaller second shape', {

  # Align two squares
  cube1 <- rbind(c(1, 1, 1), c(1, -1, 1), c(-1, -1, 1), c(-1, 1, 1), c(1, 1, -1), c(1, -1, -1), c(-1, -1, -1), c(-1, 1, -1))
  cube2 <- rbind(c(0.3, 0.3, 0.3), c(0.3, -0.3, 0.3), c(-0.3, -0.3, 0.3), c(-0.3, 0.3, 0.3), c(0.3, 0.3, -0.3), c(0.3, -0.3, -0.3), c(-0.3, -0.3, -0.3), c(-0.3, 0.3, -0.3))
  A <- abind(cube1, cube2, along = 3)


  A <- pcsstep(A, scaleDelta = FALSE)
  
  expect_equal(A[, , 1], A[, , 2])

})





test_that('pcs step works in 3D with no missing data. Multiple shapes', {

  # Align two squares
  cube1 <- rbind(c(1, 1, 1), c(1, -1, 1), c(-1, -1, 1), c(-1, 1, 1), c(1, 1, -1), c(1, -1, -1), c(-1, -1, -1), c(-1, 1, -1))
  cube3 <- rbind(c(3, 3, 3), c(3, -3, 3), c(-3, -3, 3), c(-3, 3, 3), c(3, 3, -3), c(3, -3, -3), c(-3, -3, -3), c(-3, 3, -3))
  cube0.1 <- rbind(c(0.1, 0.1, 0.1), c(0.1, -0.1, 0.1), c(-0.1, -0.1, 0.1), c(-0.1, 0.1, 0.1), c(0.1, 0.1, -0.1), c(0.1, -0.1, -0.1), c(-0.1, -0.1, -0.1), c(-0.1, 0.1, -0.1))
  cube9.1 <- rbind(c(9.1, 9.1, 9.1), c(9.1, -9.1, 9.1), c(-9.1, -9.1, 9.1), c(-9.1, 9.1, 9.1), c(9.1, 9.1, -9.1), c(9.1, -9.1, -9.1), c(-9.1, -9.1, -9.1), c(-9.1, 9.1, -9.1))
  A <- abind(cube1, cube3, cube0.1, cube9.1, along = 3)


  A <- pcsstep(A, scaleDelta = FALSE)

  expect_true(all.equal(A[, , 1], A[, , 2]))
  expect_true(all.equal(A[, , 1], A[, , 3]))
  expect_true(all.equal(A[, , 1], A[, , 4]))
  expect_true(all.equal(A[, , 2], A[, , 3]))
  expect_true(all.equal(A[, , 2], A[, , 4]))
  expect_true(all.equal(A[, , 4], A[, , 3]))


})




test_that('pcs step works with nonmatching shapes', {

  # Align two shapes
  cube1 <- rbind(c(1, 1, 1), c(1, -1, 1), c(-1, -1, 1), c(-1, 1, 1), c(1, 1, -1), c(1, -1, -1), c(-1, -1, -1), c(-1, 1, -1))
  cube2 <- rbind(c(0.32, 0.34, 0.3), c(0.39, -0.3, 0.4), c(-0.3, -0.2, 0.3), c(-0.3, 0.3, 0.5), c(0.3, 0.3, -0.2), c(0.35, -0.31, -0.399), c(-0.36, -0.2, -0.6), c(-0.1, 0.2, -0.3))
  A <- abind(cube1, cube2, along = 3)


  B <- pcsstep(A, scaleDelta = FALSE)
  
  expect_true(scorea(B, 2, 8) < scorea(A, 2, 8) )


  # Try with another pair of shapes
  cube1 <- cube2[, c(2, 3, 1)]
  A <- abind(cube1, cube2, along = 3)


  B <- pcsstep(A, scaleDelta = FALSE)
  
  expect_true(scorea(B, 2, 8) < scorea(A, 2, 8) )

})


