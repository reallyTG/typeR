# tests for kjv_bible function

context("Tidy dataframe with King James bible")

suppressPackageStartupMessages(library(dplyr))

test_that("tidy frame for KJV bible is right", {
  # Does this have the right number of lines?
  bible <- kjv_bible()
  expect_equal(nrow(bible), 31102)
  expect_equal(ncol(bible), 19)

  # Are the lines spread across each volume correctly?
  bible_test <- bible %>%
    group_by(volume_title) %>%
    summarise(total_verses = n())
  expect_equal(nrow(bible_test), 2)
  expect_equal(ncol(bible_test), 2)
})
