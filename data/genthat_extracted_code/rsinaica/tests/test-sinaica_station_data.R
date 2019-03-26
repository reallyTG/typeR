context("test-sinaica_station_data.R")

# Visit https://sinaica.inecc.gob.mx/data.php to manually check the values
test_that("sinaica_station_data returns correct data", {
  skip_on_cran()

  # Test errors in parameters
  expect_error(sinaica_station_data("ERROR"),
               "argument station_id must be an integer")
  expect_error(sinaica_station_data(271))
  expect_error(sinaica_station_data(271, "PM10", c("2015-01-01", "2016-01-10")))
  expect_error(sinaica_station_data(271, "PM10", "2015-01-01"))
  expect_error(sinaica_station_data(271, "PM10", "2015-01-01",
                                    c("2015-01-01", "2016-01-10")))
  expect_error(sinaica_station_data(271, "PM10", "2015-09-11", "2015-09-11",
                                 "Manual"),
                "for type 'Manual' data you can only request")
  expect_error(sinaica_station_data(271, "ERROR", "2015-09-11", "2015-09-11",
                                 "Manual"),
                "parameter should be one of: BEN, CH4")
  expect_error(sinaica_station_data(271, "PM10", "2015-09-11", "2015-09-11",
                                 "ERROR"),
                "type should be one of: Crude, Validated, Manual")
  expect_error(sinaica_station_data(271, "PM10", "ERROR",
                                    "2015-09-11", "Manual"),
                "date should be in YYYY-MM-DD format")
  expect_error(sinaica_station_data(271, "PM10",
                                    "2015-09-11", "ERROR", "Manual"),
                "end_date")
  expect_error(sinaica_station_data(),
               "argument station_id is missing")
  expect_error(sinaica_station_data(271, start_date = "2000-01-01",
                                 end_date = "2000-01-01"),
               "argument parameter should not be missing")
  expect_error(sinaica_station_data(271, "PM10", start_date = "2000-01-01",
                    end_date = "2000-02-02"),
               "The maximum amount of data you can download is 1 month")
  expect_error(sinaica_station_data(271, "PM10", start_date = "2000-01-01",
                                 end_date = "199-12-02"),
               "start_date should be less than or equal to end_date")


  # Datos Crudos
  df <- sinaica_station_data(271, "O3", "2015-09-11", "2015-09-11", "Crude")
  expect_equal(df$value, c(0.013, 0.015, 0.006, 0.014,
                          0.01, 0.003, 0.002, 0.004, 0.014,
                          0.026, 0.038, 0.05, 0.063, 0.045,
                          0.027, 0.027, 0.029, 0.024,
                          0.016, 0.007, 0.01, 0.01, 0.01, 0.008))

  # Because remove_extremes is set to TRUE this will actually match the
  # data on the SINAICA website for the station "Miravalle"
  df <- sinaica_station_data(106, "O3", "2017-06-12", "2017-06-12", "Crude",
                             remove_extremes = TRUE)
  expect_equal(df$value, c(0.041803, 0.04066, 0.040928, 0.04081,
                           0.027097, 0.020292, 0.015198,
                           0.021249, 0.0078623, 0.0069464,
                           0.012834, 0.025063, 0.039992,
                           0.064407, 0.11428, 0.154, 0.18171, NA,
                           0.16116, 0.12221, 0.08886,
                           0.064847, 0.055287, 0.047521))

  # Because remove_extremes is set to FALSE this will not match the
  # data on the SINAICA website for the station "Miravalle"
  df <- sinaica_station_data(106, "O3", "2017-06-12", "2017-06-12", "Crude",
                             remove_extremes = FALSE)
  expect_equal(df$value, c(0.041803, 0.04066, 0.040928, 0.04081,
                           0.027097, 0.020292, 0.015198,
                           0.021249, 0.0078623, 0.0069464,
                           0.012834, 0.025063, 0.039992,
                           0.064407, 0.11428, 0.154, 0.18171, 0.2002900,
                           0.16116, 0.12221, 0.08886,
                           0.064847, 0.055287, 0.047521))

  # Datos validados
  df <- sinaica_station_data(271, "O3", "2015-10-14", "2015-11-14", "Validated")
  expect_equal(df$value[743:748], c(0.013, 0.009, 0.019, 0.017, 0.018, 0.02))
  expect_equal(df$date[1], "2015-10-14")
  expect_equal(df$date[748], "2015-11-14")

  # Datos manuales
  df <- sinaica_station_data(271, "PM10", "2015-12-26", "2016-01-21", "Manual")
  expect_equal(df$value[1], 75)

  # Empty data
  df <- sinaica_station_data(31, "PM10", "2017-06-26", "2017-06-26", "Crude")
  expect_equal(unname(unlist(lapply(df, typeof))),
         c("integer", "character", "character", "integer", "integer",
           "character", "double"))

  # dates
  # Datos Crudos
  df <- sinaica_station_data(271, "O3", "2015-09-11", "2015-10-03", "Crude")
  expect_equal(df$date[533], "2015-10-03")
  expect_equal(df$date[1], "2015-09-11")

  ## dates are corretly filtered
  days <- seq(as.Date("2018-02-01"), as.Date("2018-03-01"), by = "day")
  for (i in seq_along(days)) {
    df <- sinaica_station_data(271, "O3", "2018-02-01", days[i])
    expect_equal(unique(df$date), as.character(days[1:i]))
    Sys.sleep(1)
  }
})
