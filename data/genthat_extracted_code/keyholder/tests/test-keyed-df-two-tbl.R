context("keyed-df-two-tbl")


# Input data --------------------------------------------------------------
band_instruments <- dplyr::band_instruments

band_members_tbl <- dplyr::band_members
band_members_df <- as.data.frame(band_members_tbl)
band_members_grouped <- band_members_tbl %>% group_by(band)
band_members_rowwise <- band_members_tbl %>% rowwise()

keys_band <- band_members_tbl %>% select(name)
assign_keys_band <- . %>% assign_keys(keys_band)


# Expectations and funcitons ----------------------------------------------
expect_commute <- function(input, .f1, .f2, type = "identical") {
  output_1 <- input %>% .f1 %>% .f2
  output_2 <- input %>% .f2 %>% .f1

  if (type == "identical") {
    expect_identical(output_1, output_2)
  } else {
    expect_equal(output_1, output_2)
  }
}

expect_commute_with_keys <- function(input, .f, type = "identical") {
  expect_commute(input = input, .f1 = .f, .f2 = assign_keys_band, type = type)
}

get_assign_permuted_keys <- function(.tbl = band_members_df, .f,
                                     base_keys = keys_band,
                                     tbl_groups = list()) {
  permutation <- .tbl %>%
    mutate(.id = 1:n()) %>%
    group_by(!!! tbl_groups) %>%
    .f() %>%
    pull(.id)

  . %>% assign_keys(base_keys[permutation, ])
}


# inner_join --------------------------------------------------------------
test_that("inner_join.keyed_df works", {
  inner_join_f <- . %>% inner_join(band_instruments, by = "name")
  assign_perm_keys <- get_assign_permuted_keys(.f = inner_join_f)

  output_1_f <- . %>% inner_join_f() %>% assign_perm_keys()
  output_2_f <- . %>% assign_keys_band() %>% inner_join_f()

  expect_identical(output_1_f(band_members_df), output_2_f(band_members_df))
  expect_identical(output_1_f(band_members_tbl), output_2_f(band_members_tbl))
  expect_identical(output_1_f(band_members_grouped),
                   output_2_f(band_members_grouped))
  expect_identical(output_1_f(band_members_rowwise),
                   output_2_f(band_members_rowwise))
})


# left_join ---------------------------------------------------------------
test_that("left_join.keyed_df works", {
  left_join_f <- . %>% left_join(band_instruments, by = "name")
  assign_perm_keys <- get_assign_permuted_keys(.f = left_join_f)

  output_1_f <- . %>% left_join_f() %>% assign_perm_keys()
  output_2_f <- . %>% assign_keys_band() %>% left_join_f()

  expect_identical(output_1_f(band_members_df), output_2_f(band_members_df))
  expect_identical(output_1_f(band_members_tbl), output_2_f(band_members_tbl))
  expect_identical(output_1_f(band_members_grouped),
                   output_2_f(band_members_grouped))
  expect_identical(output_1_f(band_members_rowwise),
                   output_2_f(band_members_rowwise))
})


# right_join --------------------------------------------------------------
test_that("right_join.keyed_df works", {
  right_join_f <- . %>% right_join(band_instruments, by = "name")
  assign_perm_keys <- get_assign_permuted_keys(.f = right_join_f)

  output_1_f <- . %>% right_join_f() %>% assign_perm_keys()
  output_2_f <- . %>% assign_keys_band() %>% right_join_f()

  expect_identical(output_1_f(band_members_df), output_2_f(band_members_df))
  expect_identical(output_1_f(band_members_tbl), output_2_f(band_members_tbl))
  expect_identical(output_1_f(band_members_grouped),
                   output_2_f(band_members_grouped))
  expect_identical(output_1_f(band_members_rowwise),
                   output_2_f(band_members_rowwise))
})


# full_join ---------------------------------------------------------------
test_that("full_join.keyed_df works", {
  full_join_f <- . %>% full_join(band_instruments, by = "name")
  assign_perm_keys <- get_assign_permuted_keys(.f = full_join_f)

  output_1_f <- . %>% full_join_f() %>% assign_perm_keys()
  output_2_f <- . %>% assign_keys_band() %>% full_join_f()

  expect_identical(output_1_f(band_members_df), output_2_f(band_members_df))
  expect_identical(output_1_f(band_members_tbl), output_2_f(band_members_tbl))
  expect_identical(output_1_f(band_members_grouped),
                   output_2_f(band_members_grouped))
  expect_identical(output_1_f(band_members_rowwise),
                   output_2_f(band_members_rowwise))
})


# semi_join ---------------------------------------------------------------
test_that("semi_join.keyed_df works", {
  semi_join_f <- . %>% semi_join(band_instruments, by = "name")
  assign_perm_keys <- get_assign_permuted_keys(.f = semi_join_f)

  output_1_f <- . %>% semi_join_f() %>% assign_perm_keys()
  output_2_f <- . %>% assign_keys_band() %>% semi_join_f()

  expect_identical(output_1_f(band_members_df), output_2_f(band_members_df))
  expect_identical(output_1_f(band_members_tbl), output_2_f(band_members_tbl))
  expect_identical(output_1_f(band_members_grouped),
                   output_2_f(band_members_grouped))
  expect_identical(output_1_f(band_members_rowwise),
                   output_2_f(band_members_rowwise))
})


# anti_join ---------------------------------------------------------------
test_that("anti_join.keyed_df works", {
  anti_join_f <- . %>% anti_join(band_instruments, by = "name")
  assign_perm_keys <- get_assign_permuted_keys(.f = anti_join_f)

  output_1_f <- . %>% anti_join_f() %>% assign_perm_keys()
  output_2_f <- . %>% assign_keys_band() %>% anti_join_f()

  expect_identical(output_1_f(band_members_df), output_2_f(band_members_df))
  expect_identical(output_1_f(band_members_tbl), output_2_f(band_members_tbl))
  expect_identical(output_1_f(band_members_grouped),
                   output_2_f(band_members_grouped))
  expect_identical(output_1_f(band_members_rowwise),
                   output_2_f(band_members_rowwise))
})
