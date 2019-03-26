context("PvarBreakTest")

test_that("Basic", {
  set.seed(12345)
  N = 1000
  x = rnorm(N) + rep(0:1, each=N/2)
  Test = PvarBreakTest(x)
  # plot(Test)
  
  expect_that(Test, is_a('PvarBreakTest'))
  expect_that(summary(Test), is_a('PvarBreakTest'))
  # expect_that(plot(Test), is_null())

})
  
  
  
  
  
