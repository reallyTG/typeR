context("lt")

test_that("misc", {
  expect_that(lt(from = Sys.Date(), Sys.Date() + 10, as = "difftime"), is_a("difftime"))
  expect_that(lt(from = Sys.Date(), Sys.Date() + 10), is_a("numeric"))
  expect_that(lt(from = Sys.Date(), Sys.Date() + 10, as = "integer"), is_a("integer"))
  expect_that(lt(from = Sys.Date(), Sys.Date() + 10), equals(10))
})