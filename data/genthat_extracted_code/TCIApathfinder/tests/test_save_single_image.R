message("\nTesting save_single_image")

setup <- function() {
  file1 <<- "file.dcm"
  file2 <<- "165.dcm"
  dir <- "~/Desktop"
  path1 <<- paste(dir, file1, sep="/")
  path2 <<- paste(dir, file2, sep="/")
  if(file.exists(path1)) file.remove(path1)
  if(file.exists(path2)) file.remove(path2)
  
  response1 <<- save_single_image(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867",
                                sop_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.257663256941568276393774062283",
                                out_dir = "~/Desktop",
                                out_file_name = "file.dcm")
  
  response2 <<- save_single_image(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867",
                                sop_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.257663256941568276393774062283",
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
  expect_error(save_single_image(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867",
                                sop_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.257663256941568276393774062283",
                                out_dir = "~/Desktop",
                                out_file_name = "file.dcm"))
  if (identical(Sys.getenv("NOT_CRAN"), "true")) {
    if(file.exists(path1)) file.remove(path1)
    if(file.exists(path2)) file.remove(path2)
  }
})


test_that("Invalid parameters", {
  skip_on_cran()
  setup()
  expect_warning(im <- save_single_image(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867",
                                       sop_instance_uid = "fake_uid",
                                       out_dir = "~/Desktop"))
  suppressWarnings(im <- save_single_image(series_instance_uid = "1.3.6.1.4.1.14519.5.2.1.5382.4002.806935685832642465081499816867",
                                          sop_instance_uid = "fake_uid",
                                          out_dir = "~/Desktop"))
  expect_true(im$response$status_code != 200)
  if (identical(Sys.getenv("NOT_CRAN"), "true")) {
    if(file.exists(path1)) file.remove(path1)
    if(file.exists(path2)) file.remove(path2)
  }
})




