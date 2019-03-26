
context("derive variable ranges")

test_that("simple cases",{
  
  # x == 1
  A <- matrix(1)
  b <- 1
  expect_equivalent(ranges(A,b,neq=1), array(c(1,1), dim=c(1,2)))
  
  # x >= 0
  # x <= 1
  A <- matrix(c(-1,1),nrow=2)
  b <- c(0,1)
  expect_equivalent(ranges(A,b,neq=0),array(c(0,1),dim=c(1,2)))

  # More indirect case
  # y == 2
  # y + z == 3 (so z == 1)
  # x + y < 0  (so -2 < x < -Inf)
  #
  A <- matrix(c(
    0,1,0,
    0,1,1,
    1,1,0),byrow=TRUE,nrow=3
  )
  b <- c(2,3,0)
  expect_equivalent(ranges(A,b,neq=2)
      , array(c(-Inf,2,1,-2,2,1),dim=c(3,2))
  )
  
})

test_that("regression tests",{
  A <- matrix(
    c( 1, 1, 0,
      -1, 0, 0,
       0,-1, 0,
       0, 0, 0),byrow=TRUE,nrow=4)
  b <- c(1130,0,0,1130)
  expect_equivalent(
    ranges(A = A,b=b,neq=1,nleq=3)
    , cbind(c(0,0,-Inf),c(1130,1130,Inf))
  )
  
  A <- matrix(0,nrow=2,ncol=3)
  b <- c(1130,1130)
  expect_equivalent(
    ranges(A=A,b=b,neq=0,nleq=2)
    , cbind(rep(-Inf,3),rep(Inf,3))
  )
})

