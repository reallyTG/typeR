context("CREA.RBS")

test_that("Test CREA.RBS with EGATUR dataset.", {

  modelFit <- CREA.RBS(GastoTotalD~pais+aloja+motivo,data=EGATUR)
  expect_equal(class(modelFit), "MLA")
  expect_equal(modelFit[[1]], "CREARBS")

})
