context("excelToSstModel")

inputExcelsBasePath <- file.path("c:/projects/sstmodel/documentation/testInputExcels")

test_that("excelToSstModel: withScenarioNoError.xlsx should not throw error", {
  excelTestName <- "withScenarioNoError.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }

  model <- excelToSstModel(path)

  expect_is(model, "sstModel")
})

test_that("excelToSstModel: providing unexisting file shoudl throw an error", {
  path <- file.path(inputExcelsBasePath, "vjvflvfdsvfdsjigrmfyherjcgviejry#1234esad")
  expect_error(excelToSstModel(path), "does not exist")
})

test_that("excelToSstModel: providing a file whose extension is not .xlsx should throw an error", {
  excelTestName <- "invalidExtension.xyz"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName,": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), "Incorrect extension")
})

test_that("excelToSstModel: excel with sheet names not matching tables should throw an error", {
  excelTestName <- "errorSheetNames.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), "not valid tab names")
})

test_that("excelToSstModel: market items are not consistent with market risk", {
  excelTestName <- "check-market-items.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), c("'Asset Prices'!F8",
                                        "'Fixed Income'!C38",
                                        "'Liabilities'!B11",
                                        "'Asset Prices Forwards'",
                                        "'FX Forwards'",
                                        "'Delta Reminder Market Risks'!B46",
                                        "'Scenarios'!E8"))
})

test_that("excelToSstModel: inconsistent macro economic scenarios with market risk", {
  excelTestName <- "macro-economic-scenarios.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), c("'Macroeconomic Scenarios'!B38",
                                        "A_USD_Spread",
                                        "participation"))
})

test_that("excelToSstModel: inconsistent copula parameters definition", {
  excelTestName <- "copula.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), c("'Copula Aggregation Parameters'!P11",
                                        "'Copula Aggregation Parameters'!Q12",
                                        "sum(scenario probabilities/region probabilities) > 1",
                                        "symmetric",
                                        "scenario2 is not semi-positive definite"))
})

test_that("excelToSstModel: duplicated market risk factor definition", {
  excelTestName <- "duplicated-mapping.table.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), "duplicated")
})

test_that("excelToSstModel: undefined health sensitivities", {
  excelTestName <- "health.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), "'Health Risk'!B8")
})

test_that("excelToSstModel: undefined health sensitivities", {
  excelTestName <- "life.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), "'Life Risk'!B14")
})

test_that("excelToSstModel: undefined health sensitivities", {
  excelTestName <- "scenario.xlsx"
  path <- file.path(inputExcelsBasePath, excelTestName)
  if (!file.exists(path)) {
    skip(paste0(excelTestName, ": isn't available (dev only test)"))
  }
  expect_error(excelToSstModel(path), c("'Scenarios'!D11",
                                        "sum of probabilities exceeds 1"))
})
