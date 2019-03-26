context("VariableRanker")

test_that("Test VarRanker with EGATUR dataset.", {

  modelFit <- VariableRanker(GastoTotalD~pais+aloja+motivo,data=EGATUR)
  expect_equal(class(modelFit), "MLA")
  expect_equal(modelFit[[1]], "Var-Rank")
  #S3 methods
    # print
  expect_is(print(modelFit),"data.frame")
  expect_equal(nrow(print(modelFit)),3)
   # summary
  expect_is(summary(modelFit),"data.frame")
  expect_equal(nrow(summary(modelFit)),3)

})
