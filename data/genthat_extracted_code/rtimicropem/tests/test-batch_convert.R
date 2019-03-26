#################################################################################################
context("batch_convert")
#################################################################################################
test_that("batch_convert outputs files", {
  skip_on_cran()
  path_to_directory <- system.file("batchtestfiles", package = "rtimicropem")
  batch_convert(path_to_directory)
  expect_true(file.exists(paste0(path_to_directory, "/", "settings.csv")))
  expect_true(file.exists(paste0(path_to_directory, "/", "measures.csv")))

})

test_that("batch_read_agd outputs errors", {
  skip_on_cran()
  path_to_directory <- system.file("batchtestfiles", package = "rtimicropem")
  expect_error(batch_convert(path_to_directory), "There are already")


  file.remove(paste0(path_to_directory, "/", "settings.csv"))
  file.remove(paste0(path_to_directory, "/", "measures.csv"))
})
