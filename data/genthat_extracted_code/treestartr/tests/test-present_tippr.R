library(ape)

test_that("Test present_tippr(tree, absent_list)", {
  tree <- read.nexus("testdata/simple.tre")
  tax_list <- dataf_parsr("testdata/bears_taxa.tsv")
  absent_list <- genera_strippr(tree, tax_list)
  tree1 <- present_tippr(tree, absent_list)
  tree1 <- multi2di(tree1, random = TRUE)
  expect_equal(tree1$Nnode, 21)
})
