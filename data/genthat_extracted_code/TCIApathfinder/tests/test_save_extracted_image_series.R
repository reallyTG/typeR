context("Testing save_extracted_image_series")

test_that("Structure of response value", {
  skip_on_cran()
  res = save_extracted_image_series(
    series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")

  testthat::expect_named(res, c("files", "dirs", "out_file", "response"))
  testthat::expect_length(res$files, 41)
  testthat::expect_length(res$dirs, 1)
  expect_equal(res$response$status_code, 200)

  res_again = save_extracted_image_series(
    series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867")
  testthat::expect_named(res_again, c("files", "dirs", "out_file", "response"))
  testthat::expect_identical(basename(res$files), basename(res_again$files))

})



