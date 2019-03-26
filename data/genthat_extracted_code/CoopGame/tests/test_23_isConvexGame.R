boolSkip=F

test_that("Check 23.1 - isConvexGame test:",{
  # v(S)=|S|-1, S!={}
  A=cardinalityGameVector(n = 4)
  A=A-1

  expect_equal(isConvexGame(A),TRUE)
  #G={12,23,34,41} non convex in consequence
  AG=c(0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 2, 2, 2, 2, 3)
  expect_equal(isConvexGame(AG),FALSE)
})


test_that("Check 23.2 - isConvexGame: example of nonconvex game",{
  v=c(1, 0,1, 0,1,1, 0)

  expect_equal(isConvexGame(v),FALSE)

  AG=c(0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 2, 2, 2, 2, 3)
  expect_equal(isConvexGame(AG),FALSE)
})




test_that("Check 23.3 - isConvexGame: example of convex game",{
  v=c(0,0,0,1,2,1,4)

  expect_equal(isConvexGame(v),TRUE)
})
