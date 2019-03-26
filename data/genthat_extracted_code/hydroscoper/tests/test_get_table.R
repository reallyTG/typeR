context("get_tables family function tests")

test_that("Missing arguments and unknown subdomains return errors", {

  subdomain <- "xxxx"

  get_fun <- c("get_stations", "get_timeseries", "get_instruments",
               "get_water_basins", "get_water_divisions",
               "get_political_divisions", "get_variables",
               "get_units_of_measurement", "get_time_steps", "get_owners",
               "get_instruments_type", "get_station_type", "get_database")

  for (fn in get_fun) {
    f <- get(fn)
    expect_error(f(subdomain))
  }
})
