

context("Front C functions")


test_that("pvarC:Exeptions", {
  expect_that( pvarC(0, 1, 1),  throws_error())
  expect_that( pvarC(0, 2, 0),  throws_error())
  expect_that( pvarC(0, 2, -1),  throws_error())
  expect_that( pvarC(vector("numeric", 0), 2, -1),  throws_error())
  expect_that( pvarC(c(1, NA), 2, -1),  throws_error())
  expect_that( pvarC(0, NA, 1),  throws_error())
  expect_that( pvarC(0, 2, NA),  throws_error())

})

test_that("AddPvarC:random", {
  set.seed(12345)
  test_AddPvar <- function(x, p){
    N = length(x)
    n1 = sample(N, 1);
    n2 = sample(N-1, 1);
    all(
      IsEqualPvar(pvarC(as.vector(x), p), AddPvarC(pvarC(x[1:n1], p), pvarC(x[(n1):N], p), AddIfPossible=TRUE))
      ,IsEqualPvar(pvarC(as.vector(x), p), AddPvarC(pvarC(x[1:n2], p), pvarC(x[(n2+1):N], p), AddIfPossible=FALSE))
    )
  }
  expect_that(all(replicate(20, test_AddPvar(rwiener(50), 2))), is_true())
  expect_that(all(replicate(20, test_AddPvar(rbridge(50), 2))), is_true())
  expect_that(all(replicate(200, test_AddPvar(rcumbin(50), 2))), is_true()) 
})

test_that("ChangePoints:Exeptions", {
  expect_that( ChangePoints(1),  equals(1)) # OK
  expect_that( ChangePoints(vector("numeric", 0)),  throws_error())
  expect_that( ChangePoints(NA),  throws_error())
})


test_that("ChangePoints:random", {
  set.seed(12345)
  test_ChangePoints <- function(x){
    SafeNearComparison(ChangePointsId_R(x), ChangePoints(x))
  }
  expect_that(all(replicate(20, test_ChangePoints(rwiener(50)))), is_true())
  expect_that(all(replicate(20, test_ChangePoints(rbridge(50)))), is_true())
  expect_that(all(replicate(20, test_ChangePoints(rcumbin(50)))), is_true())
  expect_that(all(replicate(200, test_ChangePoints(rcumbin(10)))), is_true())
})

test_that("ChangePoints:special", {
  set.seed(12345)
  expect_that(ChangePoints(c(0)), equals(1))
  expect_that(ChangePoints(c(0, 0)), equals(c(1,2)))
  expect_that(ChangePoints(c(0, 0, 0)), equals(c(1,3)))
  expect_that(ChangePoints(c(0, 0, 0, 0, 0)), equals(c(1,5)))
  expect_that(ChangePoints(c(0, 0, 1, 1, 1)), equals(c(1,5)))
  expect_that(ChangePoints(c(0, 0, 1, 1, 0)), equals(c(1,4,5)))
  expect_that(ChangePoints(c(0, 1, 1, -1, 0)), equals(c(1,3,4,5)))

})





