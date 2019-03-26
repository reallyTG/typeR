context("Test the low level arg checkers work")

# Most of these tests are repeated in 'test_fetch_errors'. These tests are designed to make
# sure the low level functions work as expected. The other file makes sure arguments are
# correctly parsed from fetch_tracks to the argument checkers

test_that("Non characters throw error", {
  expect_error(check_args_are_chr("one", "two", 12),
               regexp = "All arguments must be supplied as characters", fixed = TRUE)
  expect_error(check_args_are_chr(13, "two", 12),
               regexp = "All arguments must be*")
  expect_error(check_args_are_chr(13, 15, 12),
               regexp = "All arguments must be*")
  expect_error(check_args_are_chr("one", 15, 12),
               regexp = "All arguments must be*")
})

test_that("Characters do not throw errors", {
  expect_error(check_args_are_chr("one", "two", "three"), NA)
})


test_that("Missing start_page does not throw error", {
  expect_error(check_args_are_chr("one", "two"), NA)
})


test_that("start_page is converted to numeric", {
  expect_equal(check_start_page_to_numeric("1"), 1)
  expect_equal(check_start_page_to_numeric("7632"), 7632)
})

test_that("check_start_page throws error on non-numbers", {
  expect_error(check_start_page_to_numeric("boo"),
               regexp = "start_page could not be converted*")
})

test_that("check_start_page truncates decimals", {
  expect_equal(check_start_page_to_numeric("1.5"), 1)
  expect_equal(check_start_page_to_numeric(34.76), 34)
})
