
context("define CP")

test_that("cp has the correct default values for wa and r", {
  myCP <-cp("myCP", c("bad", "good", "very bood"))
  expect_that (class(myCP), equals("cp"))
  expect_that(myCP$a, equals(c("bad", "good", "very bood")))
  expect_that(myCP$w, equals(c(0, 0, 0)))
  expect_that(myCP$r, equals(c(1, 1, 1)))
})

test_that("cp has the correct default values for wa, wb and r", {
  myCP <- cp("myCP", c("bad", "good", "very bood"), c("low", "moderate", "high"))
  expect_that(myCP$a, equals(c("bad", "good", "very bood")))
  expect_that(myCP$b,  equals(c("low", "moderate", "high")))
  expect_that(myCP$w, equals(c(0, 0, 0)))
  expect_that(myCP$wb, equals(c(0, 0, 0)))
  expect_that(myCP$r, equals(c(1, 1, 1)))
})

test_that("cp set the r values", {
  myCP <- cp("myCP", c("bad", "good", "very bood"), r=c(1,0.8,0.9))
  expect_that(myCP$r, equals(c(1,0.8,0.9)))
  expect_that(myCP$w, equals(c(0, 0, 0)))
})

test_that("cp set the r values", {
myCP <- cp("myCP", c("bad", "good", "very bood"), c("low", "moderate", "high"), c(1,0.8,0.9))
expect_that(myCP$r, equals(c(1,0.8,0.9)))
expect_that(myCP$b,  equals(c("low", "moderate", "high")))
expect_that(myCP$w, equals(c(0, 0, 0)))
expect_that(myCP$wb, equals(c(0, 0, 0)))
})

