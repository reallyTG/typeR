context("parse bib files")

test_that("sort bib correctly sorts", {
  if (file.exists("./sort-bib/correctly-sorted-out.bib")){
    file.remove("./sort-bib/correctly-sorted-out.bib")
  }
  reorder_bib("./sort-bib/incorrectly-sorted.bib",
              "./sort-bib/correctly-sorted-out.bib")
  expect <- readLines("./sort-bib/correctly-sorted.bib",
                      encoding = "UTF-8",
                      warn = FALSE)
  actual <- readLines("./sort-bib/correctly-sorted-out.bib",
                      encoding = "UTF-8",
                      warn = FALSE)
  expect_identical(actual, expect)
})
