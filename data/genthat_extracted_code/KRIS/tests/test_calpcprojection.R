context("Projected PCA for SNPs")

test_that("Projected PCA for SNPs",{

  data(example_SNP)

  ind_status <- sample(c(1,2), size = length(sample_labels), replace = T)

  PCs <- cal.pc.projection(simsnp$snp, status = ind_status,
                           labels = sample_labels, no.pc = 3)

  expect_length(PCs, 4)
  expect_length(PCs$label, 753)
  expect_length(PCs$status, 753)
  expect_null(PCs$id)
  expect_length(PCs$PC, 2259)
})
