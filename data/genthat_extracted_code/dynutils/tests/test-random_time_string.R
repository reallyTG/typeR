context("Random time string helper")

test_that("Generating random strings", {
  random_strings <- sapply(seq_len(1000), function(x) random_time_string())
  expect_equal(length(unique(random_strings)), length(random_strings))

  random_strings <- sapply(seq_len(1000), function(x) random_time_string("somestring"))
  expect_equal(length(unique(random_strings)), length(random_strings))
})
