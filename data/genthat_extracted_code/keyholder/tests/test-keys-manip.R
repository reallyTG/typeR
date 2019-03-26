context("keys-manip")


# Input data --------------------------------------------------------------
df <- mtcars


# remove_keys -------------------------------------------------------------
test_that("remove_keys.default works", {
  df_keyed <- key_by(df, vs, am)
  output <- remove_keys(df_keyed, vs)

  expect_equal(colnames(attr(output, "keys")), "am")
  expect_is(output, "keyed_df")
  expect_equal(colnames(df_keyed), colnames(output))
})

test_that("remove.keys.default correctly unkeys", {
  df_keyed <- key_by(df, vs, am)
  output_1 <- remove_keys(df_keyed, everything(), .unkey = FALSE)

  expect_equal(ncol(attr(output_1, "keys")), 0)
  expect_is(output_1, "keyed_df")

  output_2 <- remove_keys(df_keyed, everything(), .unkey = TRUE)

  expect_equal(attr(output_2, "keys"), NULL)
  expect_false(inherits(output_2, "keyed_df"))
})


# restore_keys ------------------------------------------------------------
test_that("restore_keys.default works", {
  expect_identical(restore_keys(df), df)

  df_keyed_1 <- key_by(df, vs, am)
  df_keyed_1$vs <- 1
  df_keyed_1$am <- 0
  output_1 <- restore_keys(df_keyed_1, vs)
  output_ref_1 <- df_keyed_1
  output_ref_1$vs <- df$vs
  output_ref_1$am <- 0

  expect_identical(output_1, output_ref_1)

  df_keyed_2 <- key_by(df, vs, am)
  df_keyed_2$vs <- 1
  df_keyed_2$am <- NULL
  output_2 <- restore_keys(df_keyed_2, vs, am)
  output_ref_2 <- df_keyed_2
  output_ref_2$vs <- df$vs
  output_ref_2$am <- df$am

  expect_identical(output_2, output_ref_2)
})

test_that("restore_keys.default handles .remove and .unkey arguments", {
  df_keyed <- key_by(df, vs, am)
  df_keyed$vs <- 1
  df_keyed$am <- 0
  output_1 <- restore_keys(df_keyed, vs, .remove = FALSE, .unkey = FALSE)
  output_ref_1 <- df_keyed
  output_ref_1$vs <- df$vs

  expect_identical(output_1, output_ref_1)

  output_2 <- restore_keys(df_keyed, vs, .remove = TRUE, .unkey = FALSE)
  output_ref_2 <- df_keyed
  output_ref_2$vs <- df$vs
  keys(output_ref_2) <- select(keys(output_ref_2), -vs)

  expect_identical(output_2, output_ref_2)

  output_3 <- restore_keys(df_keyed, everything(),
                           .remove = FALSE, .unkey = TRUE)
  output_ref_3 <- df_keyed
  output_ref_3$vs <- df$vs
  output_ref_3$am <- df$am

  expect_identical(output_3, output_ref_3)

  output_4 <- restore_keys(df_keyed, everything(),
                           .remove = TRUE, .unkey = TRUE)

  expect_identical(output_4, df)
})

test_that("restore_keys.default preserves class", {
  df_keyed_1 <- df %>% key_by(vs, am)
  df_keyed_1$vs <- 1
  output_1 <- restore_keys(df_keyed_1, vs)

  expect_equal(class(output_1), c("keyed_df", "data.frame"))

  output_2 <- restore_keys(df_keyed_1, everything(),
                           .remove = TRUE, .unkey = TRUE)

  expect_equal(class(output_2), "data.frame")

  df_keyed_2 <- df %>% key_by(vs, am) %>% as_tibble()
  df_keyed_2$vs <- 1
  output_3 <- restore_keys(df_keyed_2, vs)

  expect_equal(class(output_3), c("keyed_df", "tbl_df", "tbl", "data.frame"))

  output_4 <- restore_keys(df_keyed_2, everything(),
                           .remove = TRUE, .unkey = TRUE)

  expect_equal(class(output_4), c("tbl_df", "tbl", "data.frame"))
})

test_that("restore_keys.default handles grouping", {
  df_keyed <- df %>% key_by(vs, am)
  df_keyed$vs <- 1
  df_keyed_1 <- df_keyed %>% group_by(vs)

  expect_silent(output_1 <- df_keyed_1 %>% restore_keys(everything()))
  expect_equal(group_vars(output_1), "vs")
  expect_equal(nrow(count(output_1)), 2)

  df_keyed_2 <- df_keyed %>% group_by(gear)

  expect_silent(output_2 <- df_keyed_2 %>% restore_keys(everything()))
  expect_equal(group_vars(output_2), "gear")
  expect_equal(nrow(count(output_2)), 3)
})


# pull_key ----------------------------------------------------------------
test_that("pull_key works", {
  df_keyed <- df %>% key_by(vs, am)

  expect_identical(pull_key(df_keyed, vs), df[["vs"]])
  expect_identical(pull_key(df_keyed, "am"), df[["am"]])
  expect_identical(pull_key(df_keyed, 1), df[["vs"]])
  expect_identical(pull_key(df_keyed, -1), df[["am"]])
  expect_error(pull_key(df, vs), "no.*key")
})


# rename_keys -------------------------------------------------------------
test_that("rename_keys works", {
  df_keyed <- df %>% key_by(vs, am)

  expect_identical(rename_keys(df, new = old), df)
  expect_identical(rename_keys(df_keyed), df_keyed)

  output <- rename_keys(df_keyed, Vs = vs, aM = am)
  output_ref <- df
  keys(output_ref) <- rename(keys(df_keyed), Vs = vs, aM = am)

  expect_identical(output, output_ref)
})


# set_key_cond ------------------------------------------------------------
test_that("set_key_cond works", {
  key_tbl_1 <- tibble(x = 1:nrow(df))

  output_1 <- set_key_cond(df, key_tbl_1, FALSE)
  expect_identical(keys(output_1), key_tbl_1)

  output_2 <- set_key_cond(df, key_tbl_1, TRUE)
  expect_identical(keys(output_1), key_tbl_1)

  key_tbl_2 <- tibble(logical(nrow(df)))[-1]

  output_3 <- set_key_cond(df, key_tbl_2, FALSE)
  expect_true(inherits(output_3, "keyed_df"))
  expect_identical(attr(output_3, "keys"), key_tbl_2)

  output_4 <- set_key_cond(df, key_tbl_2, TRUE)
  expect_false(inherits(output_4, "keyed_df"))
  expect_identical(attr(output_4, "keys"), NULL)
})
