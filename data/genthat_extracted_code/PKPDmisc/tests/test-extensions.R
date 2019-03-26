context("extensions")

test_that("has_ext properly matches extensions for possible scenarios", {
  expect_true(has_ext("test.rmd", ".rmd"))
  expect_true(has_ext("test.rmd", "rmd"))
  expect_true(has_ext("test.Rmd", ".rmd", match_case=F))
  expect_true(has_ext("test.Rmd", "rmd", match_case=F))
  expect_false(has_ext("testrmd", ".rmd"))
  expect_false(has_ext("testrmd", "rmd"))
  expect_false(has_ext("test.rmd2", ".rmd"))
  expect_false(has_ext("test.rmd2", "rmd"))
})
