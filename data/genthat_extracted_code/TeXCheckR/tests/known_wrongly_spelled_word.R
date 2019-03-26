context("Known wrongly spelled word")

test_that("Wrongly spelled patterns are raised as such.", {
  expect_error(check_spelling("./tests/testthat/known_wrongly_spelled_word.tex"))
})
