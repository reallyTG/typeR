context("Read PLINK format")

test_that("Read BED file",{

  bed <- system.file("extdata", "example_SNP.bed", package="KRIS")
  bim <- system.file("extdata", "example_SNP.bim", package="KRIS")
  fam <- system.file("extdata", "example_SNP.fam", package="KRIS")
  snp <- read.bed(bed, bim, fam )

  expect_length(ls(snp), 3)
  expect_type(ls(snp), "character")
})
