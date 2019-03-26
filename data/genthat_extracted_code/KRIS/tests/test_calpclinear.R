context("Linear PCA for SNPs")

test_that("calculate linear PCA",{

  data(example_SNP)

  PCs <- cal.pc.linear(simsnp$snp, no.pc = 3)

  expect_length(PCs, 2)
  expect_length(PCs$evalue, 3)
  expect_length(PCs$PC, 2259)
})
