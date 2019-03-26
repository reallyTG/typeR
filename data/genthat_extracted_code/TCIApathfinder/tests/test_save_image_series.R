message("\nTesting save_image_series")

setup <- function() {
  file1 <<- "file.zip"
  file2 <<- "bindaas-blob-download.zip"
  dir <- "~/Desktop"
  path1 <<- paste(dir, file1, sep="/")
  path2 <<- paste(dir, file2, sep="/")
  if(file.exists(path1)) file.remove(path1)
  if(file.exists(path2)) file.remove(path2)
  
  response1 <<- save_image_series(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867",
                                out_dir = "~/Desktop",
                                out_file_name = file1)
  
  response2 <<- save_image_series(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867",
                                out_dir = "~/Desktop")
}

test_that("Structure of response value", {
  skip_on_cran()
  setup()
  expect_equal(length(response1), 2)
  expect_identical(response1$out_file, path1)
  expect_equal(response1$response$status_code, 200)
  expect_equal(response2$response$status_code, 200)
})

test_that("Files were correctly written", {
  skip_on_cran()
  setup()
  expect_true(file.exists(path1))
  expect_true(file.exists(path2))
})

test_that("Overwriting image", {
  skip_on_cran()
  setup()
  expect_error(get_single_image(save_image_series = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867",
                                out_dir = "~/Desktop",
                                out_file_name = "file.dcm"))
  if (identical(Sys.getenv("NOT_CRAN"), "true")) {
    if(file.exists(path1)) file.remove(path1)
    if(file.exists(path2)) file.remove(path2)
  }
})



