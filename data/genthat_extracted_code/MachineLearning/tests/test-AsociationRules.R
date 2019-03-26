context("AssociationRules")

test_that("Test AssociationRules with EGATUR dataset.", {

  modelFit <- AssociationRules(EGATUR[,c(2,4,5,8)])
  expect_equal(class(modelFit), "MLA")
  expect_equal(modelFit[[1]], "Association")

})
