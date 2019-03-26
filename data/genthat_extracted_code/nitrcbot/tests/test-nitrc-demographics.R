test_that("nitrc_demographics",{
  skip_on_cran()
  testthat::expect_message(nitrc_demographics('42'),'Could not find project 42 in NITRC')
  testthat::expect_is(nitrc_demographics('ixi'),'data.frame')
  testthat::expect_is(nitrc_demographics(),'data.frame')
  testthat::expect_null(nitrc_demographics('kin',jsessionID = ""))
})
