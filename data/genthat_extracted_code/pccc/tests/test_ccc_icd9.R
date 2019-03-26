# Overview of tests for ccc():
#   ICD 9
#     X invalid input (not real ICD codes)
#     X check output for saved file - if it changes, I want to know
#     X missing diagnoses list
#     X missing procedure list
#     X missing ID column
#     X no input
#     X need to test each category of CCC - one code from each category
#       Neuro
#       ....
#     performance test?
#
###############################################################################
#
# run tests with Ctrl/Cmd + Shift + T or devtools::test()
# for manually running, execute
#   library(testthat)
library(pccc)

context("PCCC - ccc ICD9 function tests")

# Basic checks of standard output ---------------------------------------------

test_that("Correct number of rows (1 per patient) returned?", {
  expect_that(
    nrow(ccc(pccc::pccc_icd9_dataset[, c(1:21)],
             id      = id,
             dx_cols = dplyr::starts_with("dx"),
             pc_cols = dplyr::starts_with("pc"),
             icdv    = 9))
    , equals(1000))
})

test_that("Correct number of columns (1 per category + Id column + summary column) returned?", {
  expect_that(
    ncol(ccc(pccc::pccc_icd9_dataset[, c(1:21)],
             id      = id,
             dx_cols = dplyr::starts_with("dx"),
             pc_cols = dplyr::starts_with("pc"),
             icdv    = 9)),
    equals(14))
})

# None of these should result in an error -------------------------------------
test_that("icd 9 data set with all parameters - result should be unchanged.", {
  # saved as icd9_test_result
  expect_true(
    dplyr::all_equal(
      ccc(pccc::pccc_icd9_dataset[, c(1:21)],
          id      = id,
          dx_cols = dplyr::starts_with("dx"),
          pc_cols = dplyr::starts_with("pc"),
          icdv    = 9),
      test_helper(icd9_test_result))
  )
})

# should not be equal, and should have many differences
test_that("icd 9 data set with ICD10 parameter", {
  expect_that(
    typeof(dplyr::all_equal(
      ccc(pccc::pccc_icd9_dataset[, c(1:21)],
          id      = id,
          dx_cols = dplyr::starts_with("dx"),
          pc_cols = dplyr::starts_with("pc"),
          icdv    = 10),
      test_helper(icd9_test_result))),
    equals("character")
  )
})

test_that("icd 9 data set with missing id parameter", {
  expect_true(
    dplyr::all_equal(
      ccc(pccc::pccc_icd9_dataset[, c(1:21)],
          dx_cols = dplyr::starts_with("dx"),
          pc_cols = dplyr::starts_with("pc"),
          icdv    = 9),
      test_helper(icd9_test_result) %>% dplyr::select(-id))
  )
})

test_that("icd 9 data set with missing dx parameter", {
  expect_that(
    typeof(dplyr::all_equal(
      ccc(pccc::pccc_icd9_dataset[, c(1:21)],
          id      = id,
          pc_cols = dplyr::starts_with("pc"),
          icdv    = 9),
      test_helper(icd9_test_result))),
    equals('character')
  )
})

test_that("icd 9 data set with missing pc parameter", {
  expect_that(
    typeof(dplyr::all_equal(
      ccc(pccc::pccc_icd9_dataset[, c(1:21)],
          id      = id,
          pc_cols = dplyr::starts_with("dx"),
          icdv    = 9),
      test_helper(icd9_test_result))),
    equals('character')
  )
})

# should not be equal, and should have many differences
test_that("icd 10 data set with ICD9 parameter", {
  expect_that(
    typeof(dplyr::all_equal(
      ccc(pccc::pccc_icd10_dataset[, c(1:21)],
          id      = id,
          dx_cols = dplyr::starts_with("dx"),
          pc_cols = dplyr::starts_with("pc"),
          icdv    = 9),
      test_helper(icd10_test_result))),
    equals("character")
  )
})

# Cases that should result in an error ----------------------------------------
test_that("icd 9 data set with only version parameter", {
  expect_error(
    ccc(pccc::pccc_icd9_dataset[, c(1:21)],
        icdv    = 9),
    "dx_cols and pc_cols are both missing.  At least one must not be."
  )
})

test_that("icd 9 data set with no parameters", {
  expect_error(
    ccc(pccc::pccc_icd9_dataset[, c(1:21)]),
    "dx_cols and pc_cols are both missing.  At least one must not be."
  )
})

# -----------------------------------------------------------------------------
test_that("random data set with all parameters ICD9 - result should be unchanged.", {
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
          icdv    = 9),
      test_helper(random_data_test_result)
    )
  )
})

# Need to do some sort of performance test here - don't throw error,
# but keep track of about how long this takes to run
# test_that("test to only run locally", {
#   skip_on_cran()
#   expect_equal(ccc(), 99)
# })
