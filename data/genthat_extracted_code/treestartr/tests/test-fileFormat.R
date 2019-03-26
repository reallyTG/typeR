test_that("Test dataf_parsr(dataf)", {
  dataf <- dataf_parsr("testdata/bears_taxa.tsv")
  expect_equal(nrow(dataf), 22)
  expect_equal(ncol(dataf), 2)
})
