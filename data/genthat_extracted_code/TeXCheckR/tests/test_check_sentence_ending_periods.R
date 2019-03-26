context("Sentence-ending periods")

test_that("Raises error when sentence-ending period exists", {
  expect_error(check_sentence_ending_periods("sentence-ending-period-error.tex"))
  expect_null(check_sentence_ending_periods("sentence-ending-period-ok-hl.tex"))
})
