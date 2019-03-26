context("Subsetting functions called from within cr_extract")

alpha <- hospiceALPHA
nmrc <- hospiceNMRC
rpt <- hospiceRPT

test_that("Entering unavailable rows gives a warning", {
  expect_warning(subset_row(alpha, 'j'))
  expect_warning(subset_row(alpha, 5))
  expect_warning(subset_row(alpha, '5'))
  expect_warning(subset_row(alpha, NA))
  expect_warning(subset_row(nmrc, 'j'))
  expect_warning(subset_row(nmrc, 5))
  expect_warning(subset_row(nmrc, '5'))
  expect_warning(subset_row(nmrc, NA))
})

test_that("Entering unavailable columns gives a warning", {
  expect_warning(subset_column(alpha, 'j'))
  expect_warning(subset_column(alpha, 5))
  expect_warning(subset_column(alpha, '5'))
  expect_warning(subset_column(alpha, NA))
  expect_warning(subset_column(nmrc, 'j'))
  expect_warning(subset_column(nmrc, 5))
  expect_warning(subset_column(nmrc, '5'))
  expect_warning(subset_column(nmrc, NA))
})

test_that("Proper subsets return datasets", {
  expect_type(subset_row(alpha, 100), "list")  
  expect_type(subset_row(nmrc, 100), "list")  
  expect_type(subset_column(alpha, 100), "list")  
  expect_type(subset_column(nmrc, 100), "list")  
})