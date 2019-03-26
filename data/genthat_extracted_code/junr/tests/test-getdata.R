context("Get data")

# get_index
test_that("The connection to the test url gets a response", {
  skip_on_cran()
  r <- GET(paste(base_url, "?auth_key=", api_key, sep = ""), accept_json(),
           config = httr::config(ssl_verifypeer = FALSE))
  expect_true(r$status_code %in% c(200, 403, 500))
})

test_that("We geta warning when there is no url", {
  expect_warning(get_index(api_key = api_key), "Please add a valid base URL")
})

test_that("We geta warning when there is no api_key", {
  expect_warning(get_index(base_url = base_url),
        "Please add a valid API key for the base URL you are trying to access")
})

test_that("The data index is read correctly", {
  test_index <- get_index(base_url, api_key)
  expect_true(exists("test_index"))
})

# list_guid
test_that("We geta warning when there is no url", {
  expect_warning(list_guid(api_key = api_key), "Please add a valid base URL")
})

test_that("We geta warning when there is no api_key", {
  expect_warning(list_guid(base_url = base_url),
        "Please add a valid API key for the base URL you are trying to access")
})

# list_titles
test_that("We geta warning when there is no url", {
  expect_warning(list_titles(api_key = api_key), "Please add a valid base URL")
})

test_that("We geta warning when there is no api_key", {
  expect_warning(list_titles(base_url = base_url),
        "Please add a valid API key for the base URL you are trying to access")
})

# get_data
guid <- list_guid(base_url, api_key)[1]

test_that("We geta warning when there is no url", {
  expect_warning(get_data(api_key = api_key, guid = guid), "Please add a valid base URL")
})

test_that("We geta warning when there is no api_key", {
  expect_warning(get_data(base_url = base_url, guid = guid),
        "Please add a valid API key for the base URL you are trying to access")
})

test_that("We geta warning when there is no guid", {
  expect_warning(get_data(base_url = base_url, api_key = api_key),
        "Please add a valid GUID for the dataset you are trying to access")
})

