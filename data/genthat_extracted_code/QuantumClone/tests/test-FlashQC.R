context("FlashQC")

test_that("Clustering quality is perfect on simple example", {
  FQC<-FlashQC(Cells = Input_Example,conta = c(0,0),Nclus = 2:10)
  expect_identical(NMI_cutree(FQC$cluster,FQC$filtered.data[[1]]$Chr), 1)
})

test_that("Clusters are numeric",{
  FQC<-FlashQC(Cells = Input_Example,conta = c(0,0),Nclus = 2:10)
  expect_identical(class(FQC$cluster), "integer")
})

test_that("Flash works with overdiploid",{
  set.seed(123)
  FQC<-QuantumClone::FlashQC(Cells = QuantumCat(4,100),conta = c(0,0),Nclus = 2:10)
  expect_identical(class(FQC$cluster), "integer")
})

test_that("Flash works with BIC",{
  set.seed(123)
  FQC<-QuantumClone::FlashQC(Cells = QuantumCat(4,100),conta = c(0,0),Nclus = 2:10,model.selection = "BIC")
  expect_identical(class(FQC$cluster), "integer")
})