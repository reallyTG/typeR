context("test_number.R")

test_that("count_as_ordinal works as expected", {
  test_input <- c(1, 2, 3, 4, 11, 12, 13, 101, 102, 103, 111)
  test_output <- test_input %>%
    purrr::map_chr(count_as_ordinal)
  results <- c('1st', '2nd', '3rd', '4th', '11th', '12th', '13th',
               '101st', '102nd', '103rd', '111th')
  purrr::walk2(test_output, results, expect_match)
})

test_that("number_as_comma works as expected", {
  test_input <- c(100, 1000, 10123, 10311, 1000000, 1234567.25, 100,
                1000, 10123, 10311, 1000000, 1234567.1234567)
  test_output <- test_input %>%
    purrr::map_chr(number_as_comma)
  results <- c('100', '1,000', '10,123', '10,311', '1,000,000',
                '1,234,567.25', '100', '1,000', '10,123', '10,311', '1,000,000',
                '1,234,567.1234567')
  purrr::walk2(test_output, results, expect_match)
})


test_that("count_as_ap works as expected", {
  test_input <- c(1, 2, 4, 5, 9, 10, 1000000000)
  test_output <- test_input %>%
    purrr::map_chr(count_as_ap)
  results <- c("one", "two", "four", "five", "nine", "10", "1000000000")

  purrr::walk2(test_output, results, expect_match)

  expect_error(count_as_ap(-1))
  expect_error(count_as_ap("test"))

})

test_that("count_as_word works as expected", {
  test_input <- c(100, 1000000, 1200000, 1290000, 1000000000,
                  2000000000)
  test_output <- test_input %>%
    purrr::map_chr(count_as_word)
  results <- c('100', '1.0 million', '1.2 million', '1.3 million',
              '1.0 billion', '2.0 billion')

  purrr::walk2(test_output, results, expect_match)
})
