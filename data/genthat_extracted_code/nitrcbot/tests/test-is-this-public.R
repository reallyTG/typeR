test_that("is_this_public", {
  skip_on_cran()
  testthat::expect_true(is_this_public(project = 'ixi'))
  testthat::expect_true(is_this_public('NITRC_IR_E10452'))
  testthat::expect_true(is_this_public(subject_ID = 'NITRC_IR_S05217'))
})
