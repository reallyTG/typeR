context("scoped")


# Input data --------------------------------------------------------------
df <- mtcars
df_keyed <- df %>% key_by(vs, am, disp)


# key_by_all --------------------------------------------------------------
test_that("key_by_all works", {
  output_1 <- df %>% key_by_all()
  output_ref_1 <- assign_keys(df, select_all(df))

  expect_identical(output_1, output_ref_1)

  output_2 <- df %>% key_by_all(.funs = toupper)
  output_ref_2 <- assign_keys(df, rename_all(df, toupper))

  expect_identical(output_2, output_ref_2)
})


# key_by_if ---------------------------------------------------------------
test_that("key_by_if works", {
  output_1 <- df %>% key_by_if(rlang::is_integerish)
  output_ref_1 <- assign_keys(df, select_if(df, rlang::is_integerish))

  expect_identical(output_1, output_ref_1)

  output_2 <- df %>% key_by_if(rlang::is_integerish, toupper)
  output_ref_2 <- assign_keys(df, select_if(df, rlang::is_integerish, toupper))

  expect_identical(output_2, output_ref_2)
})


# key_by_at ---------------------------------------------------------------
test_that("key_by_at works", {
  output_1 <- df %>% key_by_at(c("mpg", "hp"))
  output_ref_1 <- assign_keys(df, select_at(df, c("mpg", "hp")))

  expect_identical(output_1, output_ref_1)

  output_2 <- df %>% key_by_at(c("mpg", "hp"), toupper)
  output_ref_2 <- assign_keys(df, select_at(df, c("mpg", "hp"), toupper))

  expect_identical(output_2, output_ref_2)
})


# remove_keys_all ---------------------------------------------------------
test_that("remove_keys_all works", {
  output <- df_keyed %>% remove_keys_all()
  output_ref <- remove_keys(df_keyed, everything())

  expect_identical(output, output_ref)

  expect_silent(df_keyed %>% remove_keys_all(.funs = toupper))
})


# remove_keys_if ----------------------------------------------------------
test_that("remove_keys_if works", {
  output <- df_keyed %>% remove_keys_if(rlang::is_integerish)
  remove_syms <- select_if(keys(df_keyed), rlang::is_integerish) %>%
    names() %>% rlang::syms()
  output_ref <- df_keyed %>% remove_keys(!!! remove_syms)

  expect_identical(output, output_ref)

  expect_silent(df_keyed %>% remove_keys_if(rlang::is_integerish,
                                            .funs = toupper))
})


# remove_keys_at ----------------------------------------------------------
test_that("remove_keys_at works", {
  output <- df_keyed %>% remove_keys_at(c("vs", "disp"))
  output_ref <- df_keyed %>% remove_keys(vs, disp)

  expect_identical(output, output_ref)

  expect_silent(df_keyed %>% remove_keys_at(c("vs", "disp"), .funs = toupper))
})


# restore_keys_all --------------------------------------------------------
test_that("restore_keys_all works", {
  output_1 <- df_keyed %>% restore_keys_all(.funs = toupper,
                                            .remove = FALSE, .unkey = FALSE)
  keys_restored <- select_all(keys(df_keyed), .funs = toupper)
  output_ref_1 <- df_keyed %>% assign_tbl(keys_restored)

  expect_identical(output_1, output_ref_1)

  output_2 <- df_keyed %>% restore_keys_all(.funs = toupper,
                                            .remove = TRUE, .unkey = FALSE)
  output_ref_2 <- df_keyed %>% assign_tbl(keys_restored) %>%
    remove_keys_all(.unkey = FALSE)

  expect_identical(output_2, output_ref_2)

  output_3 <- df_keyed %>% restore_keys_all(.funs = toupper,
                                            .remove = TRUE, .unkey = TRUE)
  output_ref_3 <- df_keyed %>% assign_tbl(keys_restored) %>%
    remove_keys_all(.unkey = TRUE)

  expect_identical(output_3, output_ref_3)
})


# restore_keys_if ---------------------------------------------------------
test_that("restore_keys_if works", {
  output_1 <- df_keyed %>%
    restore_keys_if(rlang::is_integerish, .funs = toupper,
                    .remove = FALSE, .unkey = FALSE)
  keys_restored <- select_if(keys(df_keyed), rlang::is_integerish,
                             .funs = toupper)
  output_ref_1 <- df_keyed %>% assign_tbl(keys_restored)

  expect_identical(output_1, output_ref_1)

  output_2 <- df_keyed %>%
    restore_keys_if(rlang::is_integerish, .funs = toupper,
                    .remove = TRUE, .unkey = FALSE)
  output_ref_2 <- df_keyed %>% assign_tbl(keys_restored) %>%
    remove_keys_if(rlang::is_integerish, .unkey = FALSE)

  expect_identical(output_2, output_ref_2)

  output_3 <- df_keyed %>%
    restore_keys_if(rlang::is_integerish, .funs = toupper,
                    .remove = TRUE, .unkey = TRUE)
  output_ref_3 <- df_keyed %>% assign_tbl(keys_restored) %>%
    remove_keys_if(rlang::is_integerish, .unkey = TRUE)

  expect_identical(output_3, output_ref_3)
})


# restore_keys_at ---------------------------------------------------------
test_that("restore_keys_at works", {
  output_1 <- df_keyed %>%
    restore_keys_at(c("vs", "disp"), .funs = toupper,
                    .remove = FALSE, .unkey = FALSE)
  keys_restored <- select_at(keys(df_keyed), c("vs", "disp"),
                             .funs = toupper)
  output_ref_1 <- df_keyed %>% assign_tbl(keys_restored)

  expect_identical(output_1, output_ref_1)

  output_2 <- df_keyed %>%
    restore_keys_at(c("vs", "disp"), .funs = toupper,
                    .remove = TRUE, .unkey = FALSE)
  output_ref_2 <- df_keyed %>% assign_tbl(keys_restored) %>%
    remove_keys_at(c("vs", "disp"), .unkey = FALSE)

  expect_identical(output_2, output_ref_2)

  output_3 <- df_keyed %>%
    restore_keys_at(c("vs", "disp"), .funs = toupper,
                    .remove = TRUE, .unkey = TRUE)
  output_ref_3 <- df_keyed %>% assign_tbl(keys_restored) %>%
    remove_keys_at(c("vs", "disp"), .unkey = TRUE)

  expect_identical(output_3, output_ref_3)
})


# rename_keys_all ---------------------------------------------------------
test_that("rename_keys_all works", {
  output <- df_keyed %>% rename_keys_all(toupper)
  output_ref <- assign_keys(df, rename_all(keys(df_keyed), toupper))

  expect_identical(output, output_ref)
})


# rename_keys_if ----------------------------------------------------------
test_that("rename_keys_if works", {
  output <- df_keyed %>% rename_keys_if(rlang::is_integerish, toupper)
  output_ref <- assign_keys(df, rename_if(keys(df_keyed),
                                          rlang::is_integerish, toupper))

  expect_identical(output, output_ref)
})


# rename_keys_at ----------------------------------------------------------
test_that("rename_keys_at works", {
  output <- df_keyed %>% rename_keys_at(c("vs", "disp"), toupper)
  output_ref <- assign_keys(df, rename_at(keys(df_keyed),
                                          c("vs", "disp"), toupper))

  expect_identical(output, output_ref)
})
