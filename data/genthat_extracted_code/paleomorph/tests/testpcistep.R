context('Test the pci initialisation step')

library(abind)

test_that('pci centers shapes',{

  cube1 <- rbind(c(1, 1, 1), c(1, -1, 1), c(-1, -1, 1), c(-1, 1, 1), c(1, 1, -1), c(1, -1, -1), c(-1, -1, -1), c(-1, 1, -1))
  cube2 <- rbind(c(2, 2, 2), c(2, 0, 2), c(0, 0, 2), c(0, 2, 2), c(2, 2, 0), c(2, 0, 0), c(0, 0, 0), c(0, 2, 0))
  expect_true(all(cube2 - cube1 == 1))

  A <- abind(cube1, cube2, along = 3)


  A <- pcistep(A, scale = FALSE)

  expect_equal(A[, , 1], A[, , 2])

  expect_equal(lcentroid(A[, , 1]), c(0, 0, 0))
  expect_equal(lcentroid(A[, , 2]), c(0, 0, 0))


})


test_that('pci centers shapes with missing data',{

  cube1 <- rbind(c(1, 1, 1), c(1, -1, 1), c(-1, -1, 1), c(-1, 1, 1), c(1, 1, -1), c(1, -1, -1), c(-1, -1, -1), c(-1, 1, -1))
  cube2 <- rbind(c(2, 2, 2), c(2, 0, 2), c(0, 0, 2), c(NA, NA, NA), c(2, 2, 0), c(2, 0, 0), c(0, 0, 0), c(0, 2, 0))

  A <- abind(cube1, cube2, along = 3)


  A <- pcistep(A)

  expect_equal(lcentroid2(A[, , 1]), c(0, 0, 0))
  expect_equal(lcentroid2(A[, , 2]), c(0, 0, 0))


})


test_that('pci deals with scale properly', {




})





