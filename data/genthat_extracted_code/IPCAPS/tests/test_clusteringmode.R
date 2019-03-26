context("test clustering.mode")

test_that("test clustering.mode",{

  PCs <- matrix(runif(300), byrow = T, ncol = 3)
  node <- 0
  no.significant.PC <- 3
  workdir <- tempdir()

  #Interrupt the regular workflow in order to test the function
  targetdir <- file.path(workdir,"RData")
  if (!dir.exists(targetdir)){
    dir.create(targetdir)
  }

  file1 <- file.path(workdir,"RData","node0.RData")
  save(PCs,node,no.significant.PC,file = file1, compress = "bzip2")

  res <- clustering.mode(node,workdir,"clara")
  expect_length(res,100)
  expect_type(res, "integer")

  res <- clustering.mode(node,workdir,"pam")
  expect_length(res,100)
  expect_type(res, "integer")

  res <- clustering.mode(node,workdir,"mixmod")
  expect_length(res,100)
  expect_type(res, "double")

  res <- clustering.mode(node,workdir,"meanshift")
  expect_length(res,100)
  expect_type(res, "double")

  res <- clustering.mode(node,workdir,"apcluster")
  expect_length(res,100)
  expect_type(res, "double")

  res <- clustering.mode(node,workdir,"hclust")
  expect_length(res,100)
  expect_type(res, "integer")

  res <- clustering.mode(node,workdir,"rubikclust")
  expect_length(res,100)
  expect_type(res, "double")

  res <- clustering.mode(node,workdir,"mix")
  expect_length(res,100)
  expect_type(res, "double")

  file.remove(file1)
  file.remove(targetdir)
})
