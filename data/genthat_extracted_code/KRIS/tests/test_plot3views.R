context("Plotting")

test_that("plot 3 views",{

  data(example_SNP)

  PCs <- cal.pc.linear(simsnp$snp, no.pc = 3)

  file1 <- file.path(tempdir(),"Rplots.pdf")
  pdf(file1)
  res <- plot3views( PCs$PC, sample_labels)
  dev.off()
  expect_equal(res, NULL)
  file.remove(file1)
})
