test_that("get_scan_params", {
  skip_on_cran()
  testthat::expect_is(get_scan_params('NITRC_IR_E10453'),"data.frame")
  testthat::expect_is(get_scan_params('NITRC_IR_E10453', scan_type = "T1"),"data.frame")
  testthat::expect_message(get_scan_params('NITRC_IR_E10453','T3'),"Invalid scan type")
  testthat::expect_null(get_scan_params('NITRC_IR_E11072', jsessionID = ""))
})
