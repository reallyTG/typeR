context("tibble creation")

test_that("getcomics ", {
  df <- get_comic(comic = 614)
  expect_true(inherits(df, "tbl"))
  expect_true(inherits(df, "tbl_df"))
  expect_true(inherits(df, "data.frame"))
  expect_equal(nrow(df), 1)
  expect_equal(ncol(df), 11)
  expect_error(get_comic("abs"))
})

test_that("printxkcd works", {
  expect_error(print_xkcd("abs"))
})
