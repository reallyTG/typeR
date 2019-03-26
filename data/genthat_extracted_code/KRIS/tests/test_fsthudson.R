context("Fst Hudson each SNP")

test_that("calculate Fst Hudson",{

  data(example_SNP)

  idx1 <- which(sample_labels == 'pop1')
  idx2 <- which(sample_labels == 'pop2')
  fst <- fst.hudson(simsnp$snp, idx1, idx2)

  expect_equal(fst, 0.01032098)

})
