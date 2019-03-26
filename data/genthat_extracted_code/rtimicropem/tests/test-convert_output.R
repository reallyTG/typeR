library("rtimicropem")
library("dplyr")
#################################################################################################
context("Convert Output")
#################################################################################################

test_that("convert_output works for the CHAI version of output", {
  skip_on_cran()
  chaipath <- system.file("extdata", "CHAI.csv",
                          package = "rtimicropem")
  expect_that(convert_output(chaipath), is_a("micropem"))

})

test_that("convert_output works for the Columbia version of output", {
  skip_on_cran()
  columbiapath <- system.file("extdata", "ColumbiaUnix.csv",
                              package = "rtimicropem")
  expect_that(convert_output(columbiapath), is_a("micropem"))

})

test_that("convert_output works for the Columbia2 version of output", {
  skip_on_cran()
  columbiapath2 <- system.file("extdata", "ColumbiaUnix2.csv", package =
                                  "rtimicropem")
  expect_that(convert_output(columbiapath2), is_a("micropem"))

})
