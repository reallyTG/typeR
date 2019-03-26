context("Check escapes")

test_that("Dollar signs are not allowed.", {
  expect_error(check_escapes("./check-escapes/fail.tex"))
  expect_error(check_escapes("./check-escapes/fail-2.tex"))
})

test_that("Dollar signs in comments ok", {
  expect_null(check_escapes("./check-escapes/ok-behind-percent.tex"))
})
