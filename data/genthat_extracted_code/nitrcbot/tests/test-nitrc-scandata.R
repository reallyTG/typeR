test_that("nitrc_scandata",{
  skip_on_cran()
  testthat::expect_message(nitrc_scandata('42'),'Could not find project 42 in NITRC')
  testthat::expect_is(nitrc_scandata('ixi'),'data.frame')
  testthat::expect_null(nitrc_scandata('kin',jsessionID = ""))
  testthat::expect_message(nitrc_scandata(),"Aquiring scan data for all projects")
})
