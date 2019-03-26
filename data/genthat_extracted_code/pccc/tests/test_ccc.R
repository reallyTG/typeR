# Overview of tests for ccc():
#   code that is generic to ICD 9 & 10
#     X Small data set tests
#     X No data tests
#
# code used to setup and store data for tests #################################
# icd9_test_result <- ccc(pccc::pccc_icd9_dataset[, c(1:21)],
#                         id      = id,
#                         dx_cols = dplyr::starts_with("dx"),
#                         pc_cols = dplyr::starts_with("pc"),
#                         icdv    = 9)
# icd10_test_result <- ccc(pccc::pccc_icd10_dataset[, c(1:21)],
#                          id      = id,
#                          dx_cols = dplyr::starts_with("dx"),
#                          pc_cols = dplyr::starts_with("pc"),
#                          icdv    = 10)
# random_data_test_result <- ccc(dplyr::data_frame(id = letters[1:3],
#                                                  dx1 = c('sadcj89sa', '1,2.3.4,5', 'sdf 9'),
#                                                  pc1 = c('da89v#$%', ' 90v_', 'this is a super long string compared to standard ICD codes and shouldnt break anything - if it does, the world will come to an end... Ok, so maybe not, but that means I need to fix something in this package.'),
#                                                  other_col = LETTERS[1:3]),
#                                id      = id,
#                                dx_cols = dplyr::starts_with("dx"),
#                                pc_cols = dplyr::starts_with("pc"),
#                                icdv    = 9) # should be all non-matches for CCCs regardless of version
# devtools::use_data(icd9_test_result, icd10_test_result, random_data_test_result,
#                    internal = TRUE,
#                    overwrite = TRUE)
# rm(list=ls())
# gc()
###############################################################################
#
# run tests with Ctrl/Cmd + Shift + T or devtools::test()
# for manually running, execute
#   library(testthat)
library(pccc)

context("PCCC - ccc function tests covering both ICD9 & ICD 10")

# This test case catches a bug (now resolved) that where if only 1 patient with 1 diagnosis code
# is passed, ccc fails.
# Test that one code results in just the one category getting flagged as true
for (code in c(9, 10)) {
  for (row in rownames(get_codes(code))) {
    dx <- get_codes(code)[row,]$dx

    result <- ccc(dplyr::data_frame(id = 'a',
                                    dx1 = sample(dx, 1)),
                  id      = id,
                  dx_cols = dplyr::starts_with("dx"),
                  icdv    = code)

    test_that(paste0("Checking that ICD", code, " dx code drawn from '", row, "' sets only that one category to true."), {
      expect_true(result[row] == 1)
    })

    if (!(row %in% c('tech_dep', 'transplant'))) {
      # look at other columns - should all be 0 except these 4
      tmp <- result[,!names(result) %in% c(row, 'id', 'tech_dep', 'transplant', 'ccc_flag')]
      test_that(paste0("Checking that ICD", code, " dx code drawn from '", row, "' has all other categories set to false."), {
        expect_true(all(tmp == 0))
      })
    }

    # not all categories have procedure codes
    pc <- get_codes(code)[row,]$pc
    if(length(pc) > 0) {
      result <- ccc(dplyr::data_frame(id = 'a',
                                      pc1 = sample(pc, 1)),
                    id      = id,
                    pc_cols = dplyr::starts_with("pc"),
                    icdv    = code)
      test_that(paste0("Checking that ICD", code, " pc code drawn from '", row, "' sets only that one category to true."), {
        expect_true(result[row] == 1)
      })

      if (!(row %in% c('tech_dep', 'transplant'))) {
        # look at other columns - should all be 0 except these 4
        tmp <- result[,!names(result) %in% c(row, 'id', 'tech_dep', 'transplant', 'ccc_flag')]
        test_that(paste0("Checking that ICD", code, " pc code drawn from '", row, "' has all other categories set to false."), {
          expect_true(all(tmp == 0))
        })
      }
    }
  }

  #######
  # test 1 patient with no data - should have all CCCs as FALSE
  #######
  test_that("1 patient with no diagnosis data - should have all CCCs as FALSE", {
    expect_true(all(ccc(dplyr::data_frame(id = 'a',
                                          dx1 = NA),
                        dx_cols = dplyr::starts_with("dx"),
                        icdv    = code) == 0))
  })

  # Due to previous use of sapply in ccc.R, this would fail - fixed now
  test_that("1 patient with multiple rows of no diagnosis data - should have all CCCs as FALSE", {
    expect_true(all(ccc(dplyr::data_frame(id = 'a',
                                          dx1 = NA,
                                          dx2 = NA),
                        dx_cols = dplyr::starts_with("dx"),
                        icdv    = code) == 0))
  })


  test_that("1 patient with no procedure data - should have all CCCs as FALSE", {
    expect_true(all(ccc(dplyr::data_frame(id = 'a',
                                          pc1 = NA),
                        dx_cols = dplyr::starts_with("pc"),
                        icdv    = code) == 0))
  })

  # As the next block of tests rely on specific column names to be present, first validate they are as expected.
  test_that("Column names returned from ccc are as expected", {
    expect_equal(
      c("neuromusc", "cvd", "respiratory", "renal", "gi", "hemato_immu", "metabolic", "congeni_genetic", "malignancy", "neonatal", "tech_dep", "transplant", "ccc_flag"),
      colnames(
        ccc(dplyr::data_frame(id = 'a',
                              dx1 = NA),
            dx_cols = dplyr::starts_with("dx"),
            icdv    = code))
    )
  })
}
