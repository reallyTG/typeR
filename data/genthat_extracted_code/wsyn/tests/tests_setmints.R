context("setmints")

test_that("NA case",{
  ts<-c(1,1.5,2,2.5)
  expect_equal(c(.5,1,1.5,2),setmints(ts,NA))
})

test_that("NaN case",{
  ts<-c(1,2,3,4)
  expect_equal(ts,setmints(ts,NaN))
})

test_that("finite number case",{
  ts<-c(1,2,3,4)
  expect_equal(c(2,3,4,5),setmints(ts,2))
})
