library(ape)

test_that("Test text_placr(tree, mrca_df)", {
  tree <- read.nexus("testdata/simple.tre")
  mrca_df <- read.csv("testdata/mrca_df.tsv", sep = "\t")
  tree1 <- text_placr(tree, mrca_df)
  tree1 <- multi2di(tree1, random = TRUE)
  expect_equal(tree1$Nnode, 21)
})
