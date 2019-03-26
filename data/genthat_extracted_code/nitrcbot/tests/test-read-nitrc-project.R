test_that("read_nitrc_project",{
  skip_on_cran()
  testthat::expect_is(read_nitrc_project('ixi'),"data.frame")
  testthat::expect_message(read_nitrc_project('42'),"Could not find project 42 in NITRC")
  testthat::expect_null(read_nitrc_project('kin', jsessionID = ""))
})
