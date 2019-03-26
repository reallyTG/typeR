
context("change_col_name")

ab <- data.frame(a = letters[1:10], b = 1:10)

test_that("change_col_name", {
  expect_equal(ncol(change_col_name(ab, "a", "b")), 1)
  expect_warning(ncol(change_col_name(ab, "a", "b", TRUE)))
  expect_equal(anyDuplicated(names(change_col_name(ab, "a", "b"))), 0)
})

