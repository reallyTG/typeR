context("Bad opening quotes")

test_that("Correctly identified", {
  expect_null(check_quote_marks("./open-quotes/no-open-quotes.tex"))
  expect_error(check_quote_marks("./open-quotes/bad-open-quotes.tex"),
               regexp = "Closing quote used at beginning of word")
  expect_error(check_quote_marks("./open-quotes/bad-dbl-open-quotes.tex"),
               regexp = "Closing quote used at beginning of word")
  expect_error(check_quote_marks("./open-quotes/bad-open-quotes-2.tex"),
               regexp = "Closing quote used at beginning of word")
  expect_error(check_quote_marks("./open-quotes/bad-open-quotes-3.tex"),
               regexp = "Closing quote used at beginning of word")
})
