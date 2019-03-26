context("keys-set")


# Input data --------------------------------------------------------------
df <- mtcars


# `keys<-` ----------------------------------------------------------------
test_that("`keys<-` works", {
  input_keys <- tibble(x = 1:nrow(df))
  keys(df) <- input_keys

  expect_identical(attr(df, "keys"), input_keys)
  expect_is(df, "keyed_df")
})

test_that("`keys<-` converts value to tibble", {
  input_keys <- 1:nrow(df)
  keys(df) <- input_keys

  expect_identical(attr(df, "keys"), tibble(value = input_keys))

  df_1 <- df
  input_keys <- data.frame(x = 1:nrow(df_1))
  keys(df_1) <- input_keys

  expect_identical(attr(df_1, "keys"), as_tibble(input_keys))
})

test_that("`keys<-` throws an error", {
  input_keys <- 1:(nrow(df) - 1)

  expect_error(keys(df) <- input_keys, "row")
})


# assign_keys -------------------------------------------------------------
test_that("assign_keys works", {
  input_keys <- tibble(x = 1:nrow(df))
  df <- assign_keys(df, input_keys)

  expect_identical(attr(df, "keys"), input_keys)
  expect_is(df, "keyed_df")
})


# key_by ------------------------------------------------------------------
test_that("key_by.default works", {
  output_1 <- key_by(df, vs)

  expect_identical(attr(output_1, "keys"), as_tibble(df[, "vs", drop = FALSE]))

  output_2 <- key_by(df)

  expect_identical(output_2, df)
})

test_that("key_by.default handles .add and .exclude arguments", {
  df_1 <- key_by(df, vs)
  output_1 <- key_by(df_1, am, .add = FALSE, .exclude = FALSE)

  expect_equal(colnames(attr(output_1, "keys")), "am")
  expect_true("am" %in% colnames(output_1))

  output_2 <- key_by(df_1, am, .add = TRUE, .exclude = FALSE)

  expect_equal(colnames(attr(output_2, "keys")), c("vs", "am"))
  expect_true("am" %in% colnames(output_2))

  output_3 <- key_by(df_1, am, .add = FALSE, .exclude = TRUE)

  expect_equal(colnames(attr(output_3, "keys")), "am")
  expect_false("am" %in% colnames(output_3))

  output_4 <- key_by(df_1, am, .add = TRUE, .exclude = TRUE)

  expect_equal(colnames(attr(output_4, "keys")), c("vs", "am"))
  expect_false("am" %in% colnames(output_4))
})

test_that("key_by.default overrides keys in case .add is TRUE", {
  df_1 <- key_by(df, vs, am)
  df_1$vs <- 1
  output <- key_by(df_1, gear, vs, .add = TRUE)
  output_keys_ref <- keys(df_1)
  output_keys_ref$vs <- 1
  output_keys_ref$gear <- df$gear

  expect_identical(keys(output), output_keys_ref)
})

test_that("key_by.default removes keys in case .add is TRUE", {
  df_1 <- df %>% as_tibble() %>% key_by(vs)
  output <- key_by(df_1, am, .add = FALSE)

  expect_false(inherits(keys(output), "keyed_df"))
  expect_null(attr(keys(output), "keys"))
})

test_that("key_by.default handles grouped_df", {
  output <- df %>% group_by(gear, vs) %>% key_by(vs, am)

  expect_equal(class(output)[1:2], c("keyed_df", "grouped_df"))
  expect_equal(group_vars(output), c("gear", "vs"))
  expect_false(is_grouped_df(attr(output, "keys")))
})


# unkey -------------------------------------------------------------------
test_that("unkey.default works", {
  attr(df, "keys") <- 1:3
  output <- unkey(df)

  expect_null(attr(output, "keys"))
})

test_that("unkey.keyed_df works", {
  df_keyed <- key_by(df, vs, am)
  output <- unkey(df_keyed)

  expect_false(inherits(output, "keyed_df"))
  expect_null(attr(output, "keys"))

  class(df_keyed) <- c("keyed_df", "keyed_df", "data.frame")
  expect_equal(class(unkey(df_keyed)), "data.frame")
})
