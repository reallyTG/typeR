context("nth arg positions")

test_that("Closing brace for nth argument", {
  skip_if_not_installed("stringi")
  expect_equal(nth_arg_positions("A \\abc[12]{def}{agh} and \\abc{de}[3]{fghi}.", "abc", n = 2L), 
               list(data.table::data.table(starts = c(16, 37), stops = c(20, 42), zero_width = c(FALSE, FALSE))))
  expect_equal(nth_arg_positions("A \\abc[12]{def}{agh} and \\abc{de}[3]{fghi}.", "abc", n = 2L, data.tables = FALSE), 
               list(list(starts = c(16, 37), stops = c(20, 42), zero_width = c(FALSE, FALSE))))
  
  expect_equal(nth_arg_positions("A \\abc[12]{def}{agh} and \\abc{de}[3]{}.", "abc", n = 2L, data.tables = FALSE), 
               list(list(starts = c(16, 37), stops = c(20, 38), zero_width = c(FALSE, TRUE))))
})

test_that("Corner cases: empty lines", {
  skip_if_not_installed("stringi")
  out <- nth_arg_positions("", "foo")
  expect_true(is.na(out[[1]][["starts"]]))
})

test_that("Optional arguments", {
  skip_if_not_installed("stringi")
  out <- nth_arg_positions("See \\textcite[Ante][Post]{Knuth1} [if you want].",
                           command_name = "textcite", 
                           n = 2L, 
                           optional = TRUE)
  expect_identical(out, 
                   list(data.table(starts = 20L, stops = 25L, zero_width = FALSE)))
})

test_that("Disallow stringi", {
  out <- nth_arg_positions("", "foo", allow_stringi = FALSE)
  expect_true(is.na(out[[1]][["starts"]]))
  out <- nth_arg_positions("See \\textcite[Ante][Post]{Knuth1} [if you want].",
                           command_name = "textcite", 
                           n = 2L, 
                           optional = TRUE,
                           allow_stringi = FALSE)
  expect_identical(out, 
                   list(data.table(starts = 20L, stops = 25L, zero_width = FALSE)))
})

