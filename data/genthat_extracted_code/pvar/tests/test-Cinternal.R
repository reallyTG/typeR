
context("Inner C functions")

test_that("prepare_prt:random", {
  set.seed(12345)
  test_prepare_prt <- function(x, p){
    LS = prepare_prt(x, p)
    idR = ChangePointsId_R(x)
    all(
      isTRUE(all.equal(idR, LS$id)),
      isTRUE(all.equal(x[idR], LS$x, tol=1e-10)),
      isTRUE(all.equal(c(0, abs(diff(x[idR]))^p), LS$pvdiff, tol=1e-10))
    )
  }
  expect_that(all(replicate(20, test_prepare_prt(rwiener(50), 0.5))), is_true())
  expect_that(all(replicate(20, test_prepare_prt(rwiener(50), 1))), is_true())
  expect_that(all(replicate(20, test_prepare_prt(rwiener(50), 2))), is_true())
  
  expect_that(all(replicate(20, test_prepare_prt(rcumbin(5), 0.5))), is_true())
  expect_that(all(replicate(20, test_prepare_prt(rcumbin(5), 1))), is_true())
  expect_that(all(replicate(20, test_prepare_prt(rcumbin(5), 2))), is_true())
})


test_that("CheckSmallIntervals:random", {
  set.seed(12345)
  test_CheckSmallIntervals <- function(x, p, d){
    isTRUE(all.equal(CheckSmallIntervals(x, p, d), CheckSmallIntervals_R(x, p, d)));
  }
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 0.5, 1))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 0.5, 3))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 0.5, 15))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 0.5, 30))), is_true())

  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 1, 1))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 1, 3))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 1, 15))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 1, 30))), is_true())
  
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 2, 1))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 2, 3))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 2, 15))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rwiener(50), 2, 30))), is_true())  
  
  expect_that(all(replicate(20, test_CheckSmallIntervals(rcumbin(50), 2, 1))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rcumbin(50), 2, 3))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rcumbin(50), 2, 15))), is_true())
  expect_that(all(replicate(20, test_CheckSmallIntervals(rcumbin(50), 2, 30))), is_true())    
  
})


