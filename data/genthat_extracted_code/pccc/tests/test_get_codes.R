# Whenever you are tempted to type something into a print statement or a
# de-bugger expression, write it as a test instead. — Martin Fowler
#
# Tests for get_codes():
#    pass in ICD version - 9, 10, number, letter
#    ??? Not sure what else I should test...
#
# run tests with Ctrl/Cmd + Shift + T or devtools::test()
# for manually running, execute
#   library(testthat)
library(pccc)

context("PCCC - get_codes function tests")

for (code in c(9, 10)) {
  test_that("Checking to see that correct CCC categories are returned.", {
    expect_equal(
      rownames((get_codes(code))),
      c("neuromusc", "cvd", "respiratory", "renal", "gi", "hemato_immu", "metabolic", "congeni_genetic", "malignancy", "neonatal", "tech_dep", "transplant")
    )
  })

  test_that("Checking to see that all CCCs have at least 5 diagnosis codes.", {
    expect_true(
      all(
        unlist(
          lapply(rownames(get_codes(code)), function(rn) {
            length(get_codes(code)[[rn, "dx"]]) > 5
          })
        )
      )
    )
  })

  test_that("Checking to see that 10 CCCs have procedure codes.", {
    expect_true(
      sum(
        unlist(
          lapply(rownames(get_codes(code)), function(rn) {
            length(get_codes(code)[[rn, "pc"]]) >= 1
          })
        ),
        na.rm = TRUE) == 10
    )
  })

  if(code == 9) {
    test_that("Checking to see that 1 ICD 9 CCCs has fixed procedure codes.", {
      expect_true(
        sum(
          unlist(
            lapply(rownames(get_codes(code)), function(rn) {
              length(get_codes(code)[[rn, "pc_fixed"]]) >= 1
            })
          ),
          na.rm = TRUE) == 1
      )
    })

    test_that("Checking to see that 3 ICD 9 CCCs have fixed diagnosis codes.", {
      expect_true(
        sum(
          unlist(
            lapply(rownames(get_codes(code)), function(rn) {
              length(get_codes(code)[[rn, "dx_fixed"]]) >= 1
            })
          ),
          na.rm = TRUE) == 3
      )
    })
  }

  if(code == 10) {
    test_that("Checking to see that 3 ICD 9 CCCs have fixed diagnosis codes.", {
      expect_true(
        sum(
          unlist(
            lapply(rownames(get_codes(code)), function(rn) {
              length(get_codes(code)[[rn, "dx_fixed"]]) >= 1
            })
          ),
          na.rm = TRUE) == 1
      )
    })
  }

  test_that("Checking to see that a code is returned - testing first for diagnosis code from first CCC.", {
    expect_output(
      #                firstCCC, dx
      return(get_codes(code)[[1, 1]][1]),
      regexp = "\\w+",
      perl = TRUE
    )
  })

  test_that("Checking to see that correct CCC code types are returned.", {
    expect_equal(
      colnames((get_codes(code))),
      c("dx", "dx_fixed", "pc", "pc_fixed")
    )
  })
}

test_that("Checking for error if other than 9 or 10 passed in", {
  expect_error(
    get_codes(123),
    "Only ICD version 9 and 10 are supported."
  )
})

test_that("Checking for error if string passed in", {
  expect_error(
    get_codes('ABC'),
    "Not compatible with requested type"
  )
})
