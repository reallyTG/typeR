context("list_result_files")

test_that("list_result_files works", {
  dir <- paste0(scopr_example_dir(), "/ethoscope_results/")
  out <- scopr:::list_result_files(dir)

  expect_equal(nrow(out), 4)
})


test_that("list_result_files works with index file", {
  dir <- paste0(scopr_example_dir(), "/ethoscope_results/")
  out <- scopr:::list_result_files(dir, index_file = "index.txt")
  expect_equal(nrow(out), 4)
})


test_that("list_result_files fails if non existing dir", {
  dir <- paste0(scopr_example_dir(), "/random_dir/")
  expect_error(out <- scopr:::list_result_files(dir), "No \\.db file")
})

test_that("list_result_files fails if index not found", {
  dir <- paste0(scopr_example_dir(), "/ethoscope_results/")
  expect_error(out <- scopr:::list_result_files(dir, index_file = "no_index.txt"), "Could not find index file")
})


test_that("list_result_files fails works with remote index?", {
  dir = "https://raw.githubusercontent.com/rethomics/scopr/master/inst/extdata/ethoscope_results"
  out <- scopr:::list_result_files(dir, index_file = "index.txt")
  expect_equal(nrow(out), 4)
})
