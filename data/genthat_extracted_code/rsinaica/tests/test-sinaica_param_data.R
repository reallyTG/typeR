context("test-sinaica_param_data.R")

test_that("sinaica_param_data works", {
  skip_on_cran()

  # Errors
  expect_error(sinaica_param_data("ERROR", "2017-01-01", "2017-01-31"),
               "parameter should be one of: BEN, CH4")
  expect_error(sinaica_param_data("PM2.5"),
               "You need to specify a start date")
  expect_error(sinaica_param_data("PM2.5", "2012-01-01"),
               "You need to specify an end date")
  expect_error(sinaica_param_data("PM2.5", "2017-01-32", "2017-01-31"),
               "start_date should be in YYYY-MM-DD")
  expect_error(sinaica_param_data("PM2.5", "2017-02-01", "2017-02-29"),
               "end_date should be in YYYY-MM-DD")
  expect_error(sinaica_param_data("O3", "2017-01-01", "2016-12-31"),
               "start_date should be less than or equal")
  # attempting to download more than 1 month of data should throw an error
  expect_error(sinaica_param_data("PM2.5", "2017-01-01", "2017-02-28"),
               "The maximum amount of data you can download is 1 month")

  df <- sinaica_param_data("O3", "2015-10-14", "2015-10-14")
  expect_equal(df$value[1:10], c(0.0066721, 0.014782, 0.011957,
                                 0.0021908, 0.0027581, 0.0063391,
                                 0.0089907, 0.0051245, 0.0018884, 0.0029096))

  df <- sinaica_param_data("O3", "2015-10-14", "2015-10-14",
                           remove_extremes = FALSE)
  expect_equal(df$value[1:10], c(0.0066721, 0.014782, 0.011957,
                                    0.0021908, 0.0027581, 0.0063391,
                                    0.0089907, 0.0051245, 0.0018884,
                                    0.0029096))
  expect_equal(names(df), c("id", "station_id", "station_name",
                            "station_code", "network_name",
                            "network_code", "network_id",
                            "date", "hour", "parameter", "value_original",
                            "flag_original", "valid_original",
                            "value_actual", "valid_actual",
                            "date_validated", "validation_level",
                            "unit", "value"))

  ## There was a value higher than .2 O3 ppm June 12, 2017
  ## remove_extremes should incorrectly remove it
  df <- sinaica_param_data("O3", "2017-06-12", "2017-06-12",
                           remove_extremes = TRUE)
  expect_true(all(na.omit(df$value) <= .2))

  df <- sinaica_param_data("PM10", "2014-01-01", "2014-01-05",
                      "Manual")
  expect_equal(df$value[1:10], c(81, 54, 29, 58, 29, 32, 86, 15, 21, 55))


  ## should be an empty data.frame
  df <- sinaica_param_data("CN", "1997-01-01", "1997-01-01", "Crude",
                           remove_extremes = FALSE)
  expect_equal(nrow(df), 0)
  expect_equal(unname(unlist(lapply(df, typeof))),
               c("character", "integer", "character", "character", "character",
                 "character", "integer", "character", "integer", "character",
                 "character", "character", "character",
                 "character", "character",
                 "character", "character", "character", "double"))

  df <- sinaica_param_data("PM10", "2014-01-01", "2014-01-01",
                            "Manual", remove_extremes = FALSE)
  expect_equal(nrow(df), 0)
  expect_equal(unname(unlist(lapply(df, typeof))),
               c("character", "integer", "character", "character", "character",
                 "character", "integer", "character", "integer", "character",
                 "character", "character", "character", "character", "double"))
})
