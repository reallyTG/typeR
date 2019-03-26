# See test_ccc_icd9.R for data setup
#
# Pverview of tests for ICD 10
#     X invalid input (not real ICD codes)
#     X check output for saved file - if it changes, I want to know
#     X no input
#     X need to test each category of CCC
#     performance test?
#
# run tests with Ctrl/Cmd + Shift + T or devtools::test()
# for manually running, execute
#   library(testthat)
library(pccc)

context("PCCC - ccc ICD10 function tests")

test_that("random data set with all parameters ICD10 - result should be unchanged.", {
  # saved as random_data_test_result
  expect_true(
    dplyr::all_equal(
      ccc(dplyr::data_frame(id = letters[1:3],
                            dx1 = c('sadcj89sa', '1,2.3.4,5', 'sdf 9'),
                            pc1 = c('da89v#$%', ' 90v_', 'this is a super long string compared to standard ICD codes and shouldnt break anything - if it does, the world will come to an end... Ok, so maybe not, but that means I need to fix something in this package.'),
                            other_col = LETTERS[1:3]),
          id      = id,
          dx_cols = dplyr::starts_with("dx"),
          pc_cols = dplyr::starts_with("pc"),
          icdv    = 10),
      test_helper(random_data_test_result)
    )
  )
})

test_that("icd 10 data set with all parameters - result should be unchanged.", {
  # saved as icd10_test_result
  expect_true(
    dplyr::all_equal(
      ccc(pccc::pccc_icd10_dataset[, c(1:21)],
          id      = id,
          dx_cols = dplyr::starts_with("dx"),
          pc_cols = dplyr::starts_with("pc"),
          icdv    = 10),
      test_helper(icd10_test_result)
    )
  )
})
