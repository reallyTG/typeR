context("test clustering.mode")

test_that("test clustering.mode",{

  BED.file <- system.file("extdata","IPCAPS_example.bed",package="IPCAPS")
  LABEL.file <- system.file("extdata","IPCAPS_example_individuals.txt",package="IPCAPS")

  res <- ipcaps(bed=BED.file,label.file=LABEL.file,lab.col=2,out=tempdir())

  expect_type(res, "list")
  expect_length(res, 2)

  unlink(res$output.dir, recursive = TRUE)
})
