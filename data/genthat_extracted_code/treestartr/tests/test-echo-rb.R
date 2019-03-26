library(ape)
test_that("Test echo_rb(tree, mrca_df)", {
  tree <- read.nexus("testdata/simple.tre")
  mrca_df <- read.csv("testdata/mrca_df.tsv", sep = "\t")
  mrca_list <- c("Ursus_arctos", "Ursus_spelaeus", "Ursus_americanus")
  tree1 <- text_placr(tree, mrca_df)
  q_final <- echo_rb(tree1, mrca_list, "Ursus_abstrusus")
  expect_equal(length(q_final), 4)
})
