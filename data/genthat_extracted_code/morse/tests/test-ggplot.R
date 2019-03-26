data("cadmium2")

survDataset <- survData(cadmium2)
reproDataset <- reproData(cadmium2)
survfitTTDataset <- survFitTT(survDataset)
survfitDataset <- survFit(survDataset, model_type = "SD")
reprofitDataset <- reproFitTT(reproDataset)

test_that("ggplot as default", {
  skip_on_cran()
  
  plt_survData <- plot(survDataset)
  plt_reproData <- plot(reproDataset)
  plt_survFitTT <- plot(survfitTTDataset)
  plt_survFit <- plot(survfitDataset)
  plt_reproFitTT <- plot(reprofitDataset)
  plt_ppc_survFitTT <- ppc(survfitTTDataset)
  plt_ppc_survFit <- ppc(survfitDataset)
  plt_ppc_reproFitTT <- ppc(reprofitDataset)
  
  expect_is(plt_survData, "ggplot")
  expect_is(plt_reproData, "ggplot")
  expect_is(plt_survFitTT, "ggplot")
  expect_is(plt_survFit, "ggplot")
  expect_is(plt_reproFitTT, "ggplot")
  expect_is(plt_ppc_survFitTT, "ggplot")
  expect_is(plt_ppc_survFit, "ggplot")
  expect_is(plt_ppc_reproFitTT, "ggplot")
  
})
