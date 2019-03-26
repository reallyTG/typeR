library(ape)

test_that("Test genera_strippr(tax_list, tree)", {
  tree <- read.nexus("testdata/simple.tre")
  tax_list <- dataf_parsr("testdata/bears_taxa.tsv")
  expect_equal(length(genera_strippr(tree, tax_list)), 7)
})
