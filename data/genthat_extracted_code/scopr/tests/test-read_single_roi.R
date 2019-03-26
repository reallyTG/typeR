context("read_single_roi")

test_that("read_single_roi fails when expected", {
  dir <- scopr_example_dir()
  test_file <- paste(dir, "ethoscope_results/029/E_029/2016-01-25_21-14-55/2016-01-25_21-14-55_029.db",sep="/")

  expect_warning(a <- scopr:::read_single_roi(test_file,region_id = 90), "does not exist")
  expect_null(a)
  expect_error(scopr:::read_single_roi(test_file,region_id = 1, min_time = 1000, max_time = 20), "min_time can only be lower than max_time")

  # z does not exist in data
  expect_error(scopr:::read_single_roi(test_file,region_id = 1, columns=c("x", "z")), "Some of the requested columns are NOT available")
})


test_that("loading data works", {
  dir <- scopr_example_dir()
  test_file <- paste(dir, "ethoscope_results/029/E_029/2016-01-25_21-14-55/2016-01-25_21-14-55_029.db",sep="/")
  #test_file  <- "/data/ethoscope_results/053c6ba04e534be486069c3db7b10827/ETHOSCOPE_053/2017-05-08_15-41-30/2017-05-08_15-41-30_053c6ba04e534be486069c3db7b10827.db"
  a <- scopr:::read_single_roi(test_file,region_id = 1)
  expect_s3_class(a, "data.table")
})



