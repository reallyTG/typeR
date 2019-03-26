# tests for lds_scriptures function

context("Tidy dataframe with scriptures")

suppressPackageStartupMessages(library(dplyr))

test_that("tidy frame for LDS scriptures books is right", {
  # Does this have the right number of lines?
  scriptures <- lds_scriptures()
  expect_equal(nrow(scriptures), 41995)
  expect_equal(ncol(scriptures), 19)

  # Are the lines spread across each volume correctly?
  scriptures_test <- scriptures %>%
    group_by(volume_title) %>%
    summarise(total_verses = n())
  expect_equal(nrow(scriptures_test), 5)
  expect_equal(ncol(scriptures_test), 2)
})
