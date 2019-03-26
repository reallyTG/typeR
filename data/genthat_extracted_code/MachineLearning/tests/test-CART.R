context("CART")

test_that("Test CART with EGATUR dataset.", {

  modelFit <- CART(GastoTotalD~pais+aloja+motivo,data=EGATUR)
  expect_equal(class(modelFit), "MLA")
  expect_equal(modelFit[[1]], "CART")
  #S3 methods
    # print
  expect_is(print(modelFit),"rpart")
   # summary
  expect_is(summary(modelFit),"rpart")

  modelFit2 <- CART(GastoTotalD~pais+aloja,data=EGATUR,nodes_min = 5)


})
