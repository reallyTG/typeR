# Helper functions -------------------------------------------------------------

context("Test enhydris_api helper functions")
test_that("enhydris_names returns error", {
  expect_error(enhydris_names("xxxx"))
})

context("enhydris_url returns expected addresses")
test_that("enhydris_url table address", {
  subdomain <- "kyy"
  api <- "Station"
  time_id <- NULL
  exp_addr <- "http://kyy.hydroscope.gr/api/Station/?format=json"
  expect_equal(enhydris_url(subdomain, api, time_id), exp_addr)
})
test_that("enhydris_url table address", {
  subdomain <- "kyy"
  api <- "tsdata"
  time_id <- 1
  exp_addr <- "http://kyy.hydroscope.gr/api/tsdata/1/"
  expect_equal(enhydris_url(subdomain, api, time_id), exp_addr)
})


# Check API's tables -----------------------------------------------------------

# helper function to skip tests if a server in not alive
skip_if_not_online <- function(subdomain) {
  h_url <- paste0(subdomain, ".hydroscope.gr")
  if (all(is.na(pingr::ping_port(h_url, port = 80L, count = 3)))) {
    skip(paste(h_url, "is not online"))
  }
}

# helper function to check if all expected tables exist
expect_names_in_api <- function(subdomain) {
  exp_names <- c("Station", "Timeseries", "Instrument", "WaterBasin",
                 "WaterDivision", "PoliticalDivision", "Variable",
                 "UnitOfMeasurement", "TimeStep", "Organization",
                 "InstrumentType", "StationType")
  expect_true(all(exp_names %in% names(enhydris_list(subdomain))))
}

context("Test that expected tables exist in sub-domains' databases")
test_that("kyy returns expected tables", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("kyy")
  expect_names_in_api("kyy")
})
test_that("ypaat returns expected tables", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("ypaat")
  expect_names_in_api("ypaat")
})
test_that("emy returns expected tables", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("emy")
  expect_names_in_api("emy")
})
test_that("deh returns expected tables", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("deh")
  expect_names_in_api("deh")
})

# Check enhydris_get and enhydris_listfunctions --------------------------------

context("Test enhydris_get and enhydris_list functions")
test_that("Test that enhydris_get returns a JSON file as a tibble", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("kyy")
  expect_is(enhydris_get("kyy", api_value = "owner"), "tbl_df")
})
test_that("Test that returns a JSON file as a tibble, no translit", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("kyy")
  expect_is(enhydris_get("kyy", api_value = "owner", translit = FALSE),
            "tbl_df")
})
test_that("Test that KYY returns a TXT file as a tibble", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("kyy")
  expect_is(enhydris_get("kyy", api_value = "time_data", time_id = 2173),
            "tbl_df")
})

  test_that("Test that KYY returns a TXT file as a tibble", {
    skip_on_cran()
    skip_on_travis()
    skip_on_appveyor()
    skip_if_not_online("kyy")
    expect_is(enhydris_get("kyy", api_value = "time_data", time_id = 2173),
              "tbl_df")
})

test_that("Test that YPAAT returns a TXT file as a tibble", {
    skip_on_cran()
    skip_on_travis()
    skip_on_appveyor()
    skip_if_not_online("ypaat")
    expect_is(enhydris_get("ypaat", api_value = "time_data", time_id = 181),
              "tbl_df")
})

test_that("Test that returns an error if time-series doesn't exist", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("kyy")
  expect_error(enhydris_get("kyy", api_value = "time_data", time_id = 0))
})

context("Test enhydris_list function")
test_that("Test that enhydris_list function returns a list", {
  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()
  skip_if_not_online("kyy")
  expect_is(enhydris_list("kyy"), "list")
})
