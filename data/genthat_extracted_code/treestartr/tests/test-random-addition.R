library(ape)

test_that("Test rand_absent_tippr(tree, absent_list)", {
  tree <- read.nexus("testdata/simple.tre")
  tax_list <- dataf_parsr("testdata/bears_taxa.tsv")
  absent_list <- genera_strippr(tree, tax_list)
  tree1 <- rand_absent_tippr(tree, absent_list)
  tree2 <- ape::multi2di(tree1)
  expect_equal(length(tree2$tip.label), 20)
})
