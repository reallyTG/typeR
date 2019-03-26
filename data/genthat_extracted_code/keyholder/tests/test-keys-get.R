context("keys-get")


# Input data --------------------------------------------------------------
df <- mtcars


# keys --------------------------------------------------------------------
test_that("keys works", {
  output_not_keyed <- keys(df)

  expect_is(output_not_keyed, "tbl_df")
  expect_equal(dim(output_not_keyed), c(nrow(df), 0))

  df_keyed <- key_by(df, vs, am)
  output_keyed <- keys(df_keyed)

  expect_is(output_keyed, "tbl_df")
  expect_equal(colnames(output_keyed), c("vs", "am"))
  expect_equal(nrow(output_keyed), nrow(df))
})


# raw_keys ----------------------------------------------------------------
test_that("raw_keys works", {
  expect_null(raw_keys(df))

  df_keyed <- key_by(df, vs, am)
  output_ref <- df %>% select(vs, am) %>% as_tibble()

  expect_identical(raw_keys(df_keyed), output_ref)
})


# has_keys ----------------------------------------------------------------
test_that("has_keys works", {
  expect_false(has_keys(df))

  keys(df) <- 1:nrow(df)
  expect_true(has_keys(df))
})
