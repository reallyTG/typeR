library(testthat)
test_that("Test taxon_testr(tax_list)", {
  dataf <- dataf_parsr("testdata/bears_broken.tsv")
  expect_warning(taxon_testr(dataf))
})
