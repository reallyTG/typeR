context("Write PLINK format")

test_that("Write BED file",{

  data(example_SNP)

  save.file <- file.path(tempdir(),"new_SNP")
  res <- write.bed(simsnp , save.file)
  file1 <- paste0(save.file, ".bed")
  file2 <- paste0(save.file, ".bim")
  file3 <- paste0(save.file, ".fam")
  file.remove(file1, file2, file3)
  expect_equal(res, NULL)
})
