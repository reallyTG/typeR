context("keyed-df-one-tbl")


# Input data --------------------------------------------------------------
keys_mtcars <- mtcars %>% select(vs, am) %>% as_tibble()
assign_keys_mtcars <- . %>% assign_keys(keys_mtcars)

mtcars_df <- mtcars
mtcars_tbl <- as_tibble(mtcars)
mtcars_grouped <- mtcars_tbl %>% group_by(am, gear)
mtcars_rowwise <- rowwise(mtcars)


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
  expect_commute(input = input, .f1 = .f, .f2 = assign_keys_mtcars, type = type)
}

assigning_ref_keys <- function(.f, .tbl = mtcars_df, base_keys = keys_mtcars) {
  .tbl[[".id"]] <- seq_len(nrow(.tbl))
  permutation <- .f(.tbl)[[".id"]]

  . %>% assign_keys(base_keys[permutation, ])
}

get_if_permutation <- function(predicate, tbl, f_at, ...) {
  pred_columns <- names(tbl)[sapply(tbl, predicate)]
  tbl[[".id"]] <- seq_len(nrow(tbl))

  f_at(tbl, vars(pred_columns), ...)[[".id"]]
}


# select ------------------------------------------------------------------
test_that("select.keyed_df works", {
  select_f <- . %>% select(mpg, am, gear)

  expect_commute_with_keys(mtcars_df, select_f)
  expect_commute_with_keys(mtcars_tbl, select_f)
  expect_commute_with_keys(mtcars_grouped, select_f)
  expect_commute_with_keys(mtcars_rowwise, select_f)
})

test_that("select_all works", {
  select_all_f <- . %>% select_all(toupper)

  expect_commute_with_keys(mtcars_df, select_all_f)
  expect_commute_with_keys(mtcars_tbl, select_all_f)
  expect_commute_with_keys(mtcars_grouped, select_all_f)
  expect_commute_with_keys(mtcars_rowwise, select_all_f)
})

test_that("select_if works", {
  is_whole <- function(x) all(floor(x) == x)
  select_if_f <- . %>% select_if(is_whole, toupper)

  expect_commute_with_keys(mtcars_df, select_if_f)
  expect_commute_with_keys(mtcars_tbl, select_if_f)
  expect_commute_with_keys(mtcars_grouped, select_if_f)
  expect_commute_with_keys(mtcars_rowwise, select_if_f)
})

test_that("select_at works", {
  select_at_f <- . %>% select_at(vars(mpg, hp))

  expect_commute_with_keys(mtcars_df, select_at_f)
  expect_commute_with_keys(mtcars_tbl, select_at_f)
  expect_commute_with_keys(mtcars_grouped, select_at_f)
  expect_commute_with_keys(mtcars_rowwise, select_at_f)
})


# rename ------------------------------------------------------------------
test_that("rename.keyed_df works", {
  rename_f <- . %>% rename(newMPG = mpg)

  expect_commute_with_keys(mtcars_df, rename_f)
  expect_commute_with_keys(mtcars_tbl, rename_f)
  expect_commute_with_keys(mtcars_grouped, rename_f)
  expect_commute_with_keys(mtcars_rowwise, rename_f)
})

test_that("rename_all works", {
  rename_all_f <- . %>% rename_all(toupper)

  expect_commute_with_keys(mtcars_df, rename_all_f)
  expect_commute_with_keys(mtcars_tbl, rename_all_f)
  # No mtcars_grouped check because scoped renaming works badly on grouped_df
  expect_commute_with_keys(mtcars_rowwise, rename_all_f)
})

test_that("rename_if works", {
  is_not_whole <- function(x) any(floor(x) != x)
  rename_if_f <- . %>% rename_if(is_not_whole, toupper)

  expect_commute_with_keys(mtcars_df, rename_if_f)
  expect_commute_with_keys(mtcars_tbl, rename_if_f)
  # No mtcars_grouped check because scoped renaming works badly on grouped_df
  expect_commute_with_keys(mtcars_rowwise, rename_if_f)
})

test_that("rename_at works", {
  rename_at_f <- . %>% rename_at(vars(gear, vs), toupper)

  expect_commute_with_keys(mtcars_df, rename_at_f)
  expect_commute_with_keys(mtcars_tbl, rename_at_f)
  # No mtcars_grouped check because scoped renaming works badly on grouped_df
  expect_commute_with_keys(mtcars_rowwise, rename_at_f)
})


# mutate ------------------------------------------------------------------
test_that("mutate.keyed_df works", {
  mutate_f <- . %>% mutate(mpg = 0, vs = gear * gear)

  expect_commute_with_keys(mtcars_df, mutate_f)
  expect_commute_with_keys(mtcars_tbl, mutate_f)
  expect_commute_with_keys(mtcars_grouped, mutate_f)
  expect_commute_with_keys(mtcars_rowwise, mutate_f)
})

test_that("mutate_all works", {
  mutate_all_f <- . %>% mutate_all(as.character)

  expect_commute_with_keys(mtcars_df, mutate_all_f)
  expect_commute_with_keys(mtcars_tbl, mutate_all_f)
  expect_commute_with_keys(mtcars_grouped, mutate_all_f)
  expect_commute_with_keys(mtcars_rowwise, mutate_all_f)
})

test_that("mutate_if works", {
  mutate_if_f <- . %>% mutate_if(is.double, as.integer)

  expect_commute_with_keys(mtcars_df, mutate_if_f)
  expect_commute_with_keys(mtcars_tbl, mutate_if_f)
  expect_commute_with_keys(mtcars_grouped, mutate_if_f)
  expect_commute_with_keys(mtcars_rowwise, mutate_if_f)
})

test_that("mutate_at works", {
  mutate_at_f <- . %>% mutate_at(vars(mpg, vs), as.integer)

  expect_commute_with_keys(mtcars_df, mutate_at_f)
  expect_commute_with_keys(mtcars_tbl, mutate_at_f)
  expect_commute_with_keys(mtcars_grouped, mutate_at_f)
  expect_commute_with_keys(mtcars_rowwise, mutate_at_f)
})


# transmute ---------------------------------------------------------------
test_that("transmute.keyed_df works", {
  transmute_f <- . %>% transmute(mpg = 1, vs = gear)

  expect_commute_with_keys(mtcars_df, transmute_f)
  expect_commute_with_keys(mtcars_tbl, transmute_f)
  expect_commute_with_keys(mtcars_grouped, transmute_f)
  expect_commute_with_keys(mtcars_rowwise, transmute_f)
})

test_that("transmute_all works", {
  transmute_all_f <- . %>% transmute_all(as.character)

  expect_commute_with_keys(mtcars_df, transmute_all_f)
  expect_commute_with_keys(mtcars_tbl, transmute_all_f)
  # No mtcars_grouped check because grouping variables can't be modified
  expect_commute_with_keys(mtcars_rowwise, transmute_all_f)
})

test_that("transmute_if works", {
  transmute_if_f <- . %>% transmute_if(is.double, as.integer)

  expect_commute_with_keys(mtcars_df, transmute_if_f)
  expect_commute_with_keys(mtcars_tbl, transmute_if_f)
  # No mtcars_grouped check because grouping variables can't be modified
  expect_commute_with_keys(mtcars_rowwise, transmute_if_f)
})

test_that("transmute_at works", {
  transmute_at_f <- . %>% transmute_at(vars(mpg, hp), as.integer)

  expect_commute_with_keys(mtcars_df, transmute_at_f)
  expect_commute_with_keys(mtcars_tbl, transmute_at_f)
  # No mtcars_grouped check because grouping variables can't be modified
  expect_commute_with_keys(mtcars_rowwise, transmute_at_f)
})


# summarise ---------------------------------------------------------------
test_that("summarise.keyed_df works", {
  summarise_f <- . %>% summarise(meanGear = mean(gear))

  expect_false(mtcars_df %>% key_by(vs) %>% summarise_f() %>% is_keyed_df())
  expect_false(mtcars_tbl %>% key_by(vs) %>% summarise_f() %>% is_keyed_df())
  expect_false(mtcars_grouped %>% key_by(vs) %>% summarise_f() %>%
                 is_keyed_df())
  expect_false(mtcars_rowwise %>% key_by(vs) %>% summarise_f() %>%
                 is_keyed_df())
})

test_that("summarise_all works", {
  summarise_all_f <- . %>% summarise_all(funs(n()))

  expect_false(mtcars_df %>% key_by(vs) %>% summarise_all_f() %>% is_keyed_df())
  expect_false(mtcars_tbl %>% key_by(vs) %>% summarise_all_f() %>%
                 is_keyed_df())
  expect_false(mtcars_grouped %>% key_by(vs) %>% summarise_all_f() %>%
                 is_keyed_df())
  expect_false(mtcars_rowwise %>% key_by(vs) %>% summarise_all_f() %>%
                 is_keyed_df())
})

test_that("summarise_if works", {
  summarise_if_f <- . %>% summarise_if(is.double, mean)

  expect_false(mtcars_df %>% key_by(vs) %>% summarise_if_f() %>% is_keyed_df())
  expect_false(mtcars_tbl %>% key_by(vs) %>% summarise_if_f() %>% is_keyed_df())
  expect_false(mtcars_grouped %>% key_by(vs) %>% summarise_if_f() %>%
                 is_keyed_df())
  expect_false(mtcars_rowwise %>% key_by(vs) %>% summarise_if_f() %>%
                 is_keyed_df())
})

test_that("summarise_at works", {
  summarise_at_f <- . %>% summarise_at(vars(mpg, vs), mean)

  expect_false(mtcars_df %>% key_by(vs) %>% summarise_at_f() %>% is_keyed_df())
  expect_false(mtcars_tbl %>% key_by(vs) %>% summarise_at_f() %>% is_keyed_df())
  expect_false(mtcars_grouped %>% key_by(vs) %>% summarise_at_f() %>%
                 is_keyed_df())
  expect_false(mtcars_rowwise %>% key_by(vs) %>% summarise_at_f() %>%
                 is_keyed_df())
})


# group_by ----------------------------------------------------------------
test_that("group_by.keyed_df works", {
  group_by_f <- . %>% group_by(gear, vs)

  expect_commute_with_keys(mtcars_df, group_by_f)
  expect_commute_with_keys(mtcars_tbl, group_by_f)
  expect_commute_with_keys(mtcars_grouped, group_by_f)
  suppressWarnings(expect_commute_with_keys(mtcars_rowwise, group_by_f))
})

test_that("group_by_all works", {
  group_by_all_f <- . %>% group_by_all(as.character)

  expect_commute_with_keys(mtcars_df, group_by_all_f)
  expect_commute_with_keys(mtcars_tbl, group_by_all_f)
  expect_commute_with_keys(mtcars_grouped, group_by_all_f)
  suppressWarnings(expect_commute_with_keys(mtcars_rowwise, group_by_all_f))
})

test_that("group_by_if works", {
  group_by_if_f <- . %>% group_by_if(is.double)

  expect_commute_with_keys(mtcars_df, group_by_if_f)
  expect_commute_with_keys(mtcars_tbl, group_by_if_f)
  expect_commute_with_keys(mtcars_grouped, group_by_if_f)
  suppressWarnings(expect_commute_with_keys(mtcars_rowwise, group_by_if_f))
})

test_that("group_by_at works", {
  group_by_at_f <- . %>% group_by_at(vars(mpg, vs))

  expect_commute_with_keys(mtcars_df, group_by_at_f)
  expect_commute_with_keys(mtcars_tbl, group_by_at_f)
  expect_commute_with_keys(mtcars_grouped, group_by_at_f)
  suppressWarnings(expect_commute_with_keys(mtcars_rowwise, group_by_at_f))
})


# ungroup -----------------------------------------------------------------
test_that("ungroup.keyed_df works", {
  expect_commute_with_keys(mtcars_grouped, ungroup)
  suppressWarnings(expect_commute_with_keys(mtcars_rowwise, ungroup))
})


# rowwise.keyed_df --------------------------------------------------------
test_that("rowwise.keyed_df works", {
  expect_commute_with_keys(mtcars_df, rowwise.keyed_df)
  expect_commute_with_keys(mtcars_tbl, rowwise.keyed_df)
})


# distinct ----------------------------------------------------------------
test_that("distinct works", {
  expect_false(mtcars_df %>% key_by(vs, am) %>% distinct(hp) %>%
                 is_keyed_df())
})


# do ----------------------------------------------------------------------
test_that("do works", {
  expect_false(
    mtcars %>% key_by(vs, am) %>% group_by(gear) %>%
      do({summarise(., meanMPG = mean(mpg))}) %>%
      is_keyed_df()
  )
})


# arrange -----------------------------------------------------------------
test_that("arrange.keyed_df works", {
  arrange_f <- . %>% arrange(vs, desc(mpg))
  assign_perm_keys <- assigning_ref_keys(arrange_f)

  output_1_f <- . %>% arrange_f() %>% assign_perm_keys()
  output_2_f <- . %>% assign_keys_mtcars() %>% arrange_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  expect_identical(output_1_f(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))

  arrange_f_by_group <- . %>% arrange(vs, desc(mpg), .by_group = TRUE)
  assign_perm_keys_by_group <- assigning_ref_keys(
    arrange_f_by_group, mtcars_grouped
  )

  output_1_f_by_group <- . %>% arrange_f_by_group() %>%
    assign_perm_keys_by_group()
  output_2_f_by_group <- . %>% assign_keys_mtcars() %>% arrange_f_by_group()

  expect_identical(
    output_1_f_by_group(mtcars_grouped),
    output_2_f_by_group(mtcars_grouped)
  )
})

test_that("arrange_all works", {
  arrange_all_f <- . %>% arrange_all(desc)
  assign_perm_keys <- assigning_ref_keys(arrange_all_f)
  assign_perm_keys_gr <- assigning_ref_keys(arrange_all_f, mtcars_grouped)

  output_1_f <- . %>% arrange_all_f() %>% assign_perm_keys()
  output_1_f_gr <- . %>% arrange_all_f() %>% assign_perm_keys_gr()
  output_2_f <- . %>% assign_keys_mtcars() %>% arrange_all_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  expect_identical(output_1_f_gr(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))
})

test_that("arrange_if works", {
  # This is also a test for 'invisibility' of .id column
  arrange_if_f <- . %>% arrange_if(rlang::is_integerish)

  permutation <- get_if_permutation(rlang::is_integerish, mtcars_df, arrange_at)
  assign_perm_keys <- . %>% assign_keys(keys_mtcars[permutation, ])
  permutation_gr <- get_if_permutation(
    rlang::is_integerish, mtcars_grouped, arrange_at
  )
  assign_perm_keys_gr <- . %>% assign_keys(keys_mtcars[permutation_gr, ])

  output_1_f <- . %>% arrange_if_f() %>% assign_perm_keys()
  output_1_f_gr <- . %>% arrange_if_f() %>% assign_perm_keys_gr()
  output_2_f <- . %>% assign_keys_mtcars() %>% arrange_if_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  expect_identical(output_1_f_gr(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))
})

test_that("arrange_at works", {
  arrange_at_f <- . %>% arrange_at(vars("disp", "qsec"))
  assign_perm_keys <- assigning_ref_keys(arrange_at_f)
  assign_perm_keys_gr <- assigning_ref_keys(arrange_at_f, mtcars_grouped)

  output_1_f <- . %>% arrange_at_f() %>% assign_perm_keys()
  output_1_f_gr <- . %>% arrange_at_f() %>% assign_perm_keys_gr()
  output_2_f <- . %>% assign_keys_mtcars() %>% arrange_at_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  expect_identical(output_1_f_gr(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))
})


# filter ------------------------------------------------------------------
test_that("filter.keyed_df works", {
  filter_f <- . %>% filter(gear == 4, am == 1)
  assign_perm_keys <- assigning_ref_keys(filter_f)
  assign_perm_keys_gr <- assigning_ref_keys(filter_f, mtcars_grouped)

  output_1_f <- . %>% filter_f() %>% assign_perm_keys()
  output_1_f_gr <- . %>% filter_f() %>% assign_perm_keys_gr()
  output_2_f <- . %>% assign_keys_mtcars() %>% filter_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  # Filtering a grouped data changes the row order (in dplyr >= 0.8.0)
  expect_identical(output_1_f_gr(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))
})

test_that("filter_all works", {
  filter_all_f <- . %>% filter_all(all_vars(. > 0))
  assign_perm_keys <- assigning_ref_keys(filter_all_f)
  assign_perm_keys_gr <- assigning_ref_keys(filter_all_f, mtcars_grouped)

  output_1_f <- . %>% filter_all_f() %>% assign_perm_keys()
  output_1_f_gr <- . %>% filter_all_f() %>% assign_perm_keys_gr()
  output_2_f <- . %>% assign_keys_mtcars() %>% filter_all_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  # filter_all removes grouping variables before applying filter so the result
  # is different for mtcars_grouped
  expect_identical(output_1_f_gr(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))
})

test_that("filter_if works", {
  filter_if_f <- . %>% filter_if(rlang::is_integerish, all_vars(. < 100))

  permutation <- get_if_permutation(
    rlang::is_integerish, mtcars_df, filter_at, all_vars(. < 100)
  )
  assign_perm_keys <- . %>% assign_keys(keys_mtcars[permutation, ])
  permutation_gr <- get_if_permutation(
    rlang::is_integerish, mtcars_grouped, filter_at, all_vars(. < 100)
  )
  assign_perm_keys_gr <- . %>% assign_keys(keys_mtcars[permutation_gr, ])

  output_1_f <- . %>% filter_if_f() %>% assign_perm_keys()
  output_1_f_gr <- . %>% filter_if_f() %>% assign_perm_keys_gr()
  output_2_f <- . %>% assign_keys_mtcars() %>% filter_if_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  # Filtering a grouped data changes the row order (in dplyr >= 0.8.0)
  expect_identical(output_1_f_gr(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))
})

test_that("filter_at works", {
  filter_at_f <- . %>% filter_at(vars("mpg", "hp"), all_vars(. > 15))
  assign_perm_keys <- assigning_ref_keys(filter_at_f)
  assign_perm_keys_gr <- assigning_ref_keys(filter_at_f, mtcars_grouped)

  output_1_f <- . %>% filter_at_f() %>% assign_perm_keys()
  output_1_f_gr <- . %>% filter_at_f() %>% assign_perm_keys_gr()
  output_2_f <- . %>% assign_keys_mtcars() %>% filter_at_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  # Filtering a grouped data changes the row order (in dplyr >= 0.8.0)
  expect_identical(output_1_f_gr(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))
})


# slice -------------------------------------------------------------------
test_that("slice.keyed_df works", {
  slice_f <- . %>% slice(c(4, 5, 31, 3, 3, 14, 18, 30, 31, 44))
  assign_perm_keys <- assigning_ref_keys(slice_f)
  assign_perm_keys_gr <- assigning_ref_keys(slice_f, mtcars_grouped)

  output_1_f <- . %>% slice_f() %>% assign_perm_keys()
  output_1_f_gr <- . %>% slice_f() %>% assign_perm_keys_gr()
  output_2_f <- . %>% assign_keys_mtcars() %>% slice_f()

  expect_identical(output_1_f(mtcars_df), output_2_f(mtcars_df))
  expect_identical(output_1_f(mtcars_tbl), output_2_f(mtcars_tbl))
  # Slicing grouped_df is done differently
  expect_identical(output_1_f_gr(mtcars_grouped), output_2_f(mtcars_grouped))
  expect_identical(output_1_f(mtcars_rowwise), output_2_f(mtcars_rowwise))
})


# next_method_keys --------------------------------------------------------
test_that("next_method_keys ensures tibble in attr(.tbl, 'keys')", {
  input <- mtcars_df
  class(input) <- c("keyed_df", "data.frame")
  output <- next_method_keys(input, select, mpg) %>% attr("keys")
  output_ref <- tibble(logical(32))[-1]

  expect_identical(output, output_ref)
})


# next_method_keys_track --------------------------------------------------
test_that("next_method_keys_track ensures tibble in attr(.tbl, 'keys')", {
  input <- mtcars_df
  class(input) <- c("keyed_df", "data.frame")
  output_1 <- next_method_keys_track(input, arrange, mpg) %>% attr("keys")
  output_ref_1 <- tibble(logical(32))[-1]

  expect_identical(output_1, output_ref_1)

  output_2 <- next_method_keys_track(input, filter, cyl == 4) %>% attr("keys")
  output_ref_2 <- tibble(logical(11))[-1]

  expect_identical(output_2, output_ref_2)
})
