context("Utilities")

test_that("The test endpoint is still valid", {
  skip_on_cran()
  currency_data <- get_data(base_url, api_key, "LICIT-ADJUD-POR-LOS-MINIS")
  expect_true(nrow(currency_data)>0)
  expect_true(!is.null(currency_data$`Monto Adjudicado`))
})

test_that("Currency values are converted to numeric", {
  skip_on_cran()
  currency_data <- get_data(base_url, api_key, "LICIT-ADJUD-POR-LOS-MINIS")
  numeric_currency <- clean_currency(currency_data$`Monto Adjudicado`)
  expect_true(is.numeric(numeric_currency))
})
