context("test_time.R")
test_that("natural_size decimal works as expected", {
  test_input <- c(300, 3000, 3000000, 3000000000, 3000000000000,10**26 * 30)

  test_output <- test_input %>%
    purrr::map_chr(natural_size)
  results <- c('300 Bytes', '3.0 kB', '3.0 MB', '3.0 GB', '3.0 TB','3000.0 YB')
  purrr::walk2(test_output, results, expect_match)
})

test_that("natural_size binary works as expected", {
  test_input <- c(300, 3000, 3000000, 10**26 * 30)
  test_output <- test_input %>%
    purrr::map_chr(natural_size, suffix_type = 'binary')
  results <- c('300 Bytes', '2.9 KiB', '2.9 MiB',  '2481.5 YiB')
  purrr::walk2(test_output, results, expect_match)
})

test_that("natural_size gnu works as expected", {
  test_input <- c(300, 3000, 3000000, 1024, 10**26 * 30)
  test_output <- test_input %>%
    purrr::map_chr(natural_size, suffix_type =  'gnu')
  results <- c('300B', '2.9K', '2.9M', '1.0K', '2481.5Y')

  purrr::walk2(test_output, results, expect_match)
})

test_that("natural_size format passing works as expected", {
  expect_match(natural_size(3141592, 'decimal', '%.2f'), '3.14 MB')
  expect_match(natural_size(3000, 'gnu', '%.3f'), '2.930K')
  expect_match(natural_size(3000000000, 'gnu', '%.0f'), '3G')
  expect_match(natural_size(10**26 * 30, 'binary', '%.3f'), '2481.542 YiB')
})
