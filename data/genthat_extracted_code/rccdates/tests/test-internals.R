
context("internals")

test_that("is_year", {
  expect_that(is_year("kjhg"), is_false())
  expect_that(is_year(2006), is_true())
  expect_that(is_year(1234), is_false())
})

test_that("is_month", {
  expect_that(is_month("kjhg"), is_false())
  expect_that(is_month(10), is_true())
  expect_that(is_month(1234), is_false())
})


test_that("is_day", {
  expect_that(is_day("kjhg"), is_false())
  expect_that(is_day(10), is_true())
  expect_that(is_day(1234), is_false())
})


test_that("is_date", {
  expect_that(is_date("kjhg"), is_false())
  expect_that(is_date(19850504), is_true())
  expect_that(is_date("19850504"), is_true())
  expect_that(is_date("1985-05-04"), is_false())
})


test_that("is_yyww", {
  expect_that(is_yyww("kjhg"), is_false())
  expect_that(is_yyww(19850504), is_false())
  expect_that(is_yyww("19850504"), is_false())
  expect_that(is_yyww(6702), is_true())
  expect_that(is_yyww(6758), is_false())
  expect_that(is_yyww(4701), is_false())
  expect_that(is_yyww(5701, 57), is_true())  
})


test_that("as.yyww", {
  expect_that(as.yyww("kjhg"), throws_error())
  expect_that(as.yyww(19850504), throws_error())
  expect_that(as.yyww("19850504"), throws_error())
  expect_that(as.yyww(6702), is_equivalent_to(as.Date("1967-01-08")))
  expect_that(as.yyww(6758), throws_error())
  expect_that(as.yyww(4701), throws_error())
  expect_that(as.yyww(8505), is_equivalent_to(as.Date("1985-01-31")))  
})


test_that("is_yyyyww", {
  expect_that(is_yyyyww("kjhg"), is_false())
  expect_that(is_yyyyww("19850504"), is_false())
  expect_that(is_yyyyww(6702), is_false())
  expect_that(is_yyyyww(6758), is_false())
  expect_that(is_yyyyww(4701), is_false())
})


test_that("as.yyyyww", {
  expect_that(as.yyyyww("kjhg"), throws_error())
  expect_that(as.yyyyww(1985050445), throws_error())
  expect_that(as.yyyyww(196702), is_equivalent_to(as.Date("1967-01-08")))
  expect_that(as.yyyyww(196758), throws_error())
  expect_that(as.yyyyww(194701), throws_error())
  expect_that(as.yyyyww(198505), is_equivalent_to(as.Date("1985-01-31")))  
})