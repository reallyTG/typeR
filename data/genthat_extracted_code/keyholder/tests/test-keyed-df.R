context("keyed-df")


# Input data --------------------------------------------------------------
df <- mtcars
df_keyed <- df %>% key_by(vs, am)
keys_df <- keys(df_keyed)


# is_keyed_df -------------------------------------------------------------
test_that("is_keyed_df works", {
  expect_true(is_keyed_df(df_keyed))
  expect_false(is_keyed_df(df))

  class(df) <- c("keyed_df", "data.frame")

  expect_false(is_keyed_df(df))

  attr(df, "keys") <- seq_len(nrow(df) - 1)

  expect_false(is_keyed_df(df))

  attr(df, "keys") <- matrix(seq_len(nrow(df) - 1), ncol = 1)

  expect_false(is_keyed_df(df))

  attr(df, "keys") <- data.frame(x = seq_len(nrow(df) - 1))

  expect_false(is_keyed_df(df))

  df_bad_keyed <- add_class(df_keyed[[1]], "keyed_df")
  attr(df_bad_keyed, "keys") <- keys_df

  expect_false(is_keyed_df(df_bad_keyed))

  df_mat <- as.matrix(df)
  class(df_mat) <- c("keyed_df", "matrix")
  attr(df_mat, "keys") <- matrix(1:32, ncol = 1)

  expect_false(is_keyed_df(df_mat))
})


# is.keyed_df -------------------------------------------------------------
test_that("is.keyed_df works", {
  expect_identical(is.keyed_df, is_keyed_df)
})


# print -------------------------------------------------------------------
test_that("print.keyed_df works", {
  expect_output(print(df_keyed), "keyed object.*vs.*am")

  expect_output(
    df_keyed %>% remove_keys(everything(), .unkey = FALSE) %>% print(),
    "keyed object.*no.*key"
  )
})


# [ -----------------------------------------------------------------------
test_that("`[.keyed_df` works", {
  i_idx <- 1:10
  j_idx <- 1:3
  output_1 <- df_keyed[i_idx, j_idx]
  output_ref_1 <- df[i_idx, j_idx] %>%
    assign_keys(keys_df[i_idx, ])

  expect_identical(output_1, output_ref_1)

  output_2 <- df_keyed[, j_idx]
  output_ref_2 <- df[, j_idx] %>%
    assign_keys(keys_df)

  expect_identical(output_2, output_ref_2)

  output_3 <- df_keyed[i_idx, logical(0)]
  output_ref_3 <- df[i_idx, logical(0)] %>%
    assign_keys(keys_df[i_idx, ])

  expect_identical(output_3, output_ref_3)
})
