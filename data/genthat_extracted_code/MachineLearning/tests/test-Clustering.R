context("Clustering")

test_that("Test Clustering with EGATUR dataset.", {

  modelFit <- Clustering(data=EGATUR[,c("A13","gastototal")])
  expect_equal(class(modelFit), "MLA")
  expect_equal(modelFit[[1]], "Clustering")
  expect_equal(class(modelFit[[2]]),"kmeans" )

})

test_that("Test Clustering with EGATUR dataset and n==Character.", {
modelFit2 <- Clustering(data=EGATUR[,c("A13","gastototal")],n="moto")
expect_equal(class(modelFit2), "MLA")
expect_equal(modelFit2[[1]], "Clustering")
expect_equal(class(modelFit2[[2]]),"kmeans" )

})
