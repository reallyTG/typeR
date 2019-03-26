context("coding.genes")

test_that("coding genes retrieves some genes", {
  genes <- coding.genes(verbose = FALSE)
  expect_true(all(c('BRCA1', 'BRCA2', 'CHADL', 'BTBD8', 'BCAS2', 'AGAP1') %in% genes$external_gene_name))
})
