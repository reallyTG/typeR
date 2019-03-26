test_that("list_image_sets",{
  skip_on_cran()
  testthat::expect_is(list_image_sets(error = TRUE),"data.frame")
})
