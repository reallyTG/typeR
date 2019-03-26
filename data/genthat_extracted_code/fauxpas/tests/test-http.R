context("http")

test_that("http works", {
  skip_on_cran()

  library("crul")
  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  expect_message(http(res, behavior = "message"), "I'm a teapot")
  expect_warning(http(res, behavior = "warning"), "I'm a teapot")
  expect_error(http(res), "I'm a teapot")

  expect_null(suppressMessages(http(res, behavior = "message")))
  #expect_null(suppressWarnings(http(res, behavior = "warning")))
})

test_that("http fails well", {
  skip_on_cran()

  expect_error(http(5), "no 'http' method for numeric")
  expect_error(http("asdfadfasf"), "no 'http' method for character")
  expect_error(http(mtcars), "no 'http' method for data.frame")

  library("crul")
  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http(res, behavior = "asdfasdf"),
               "'behavior' must be one of")

  # message_template fails well
  expect_error(http(res, message_template = 5),
               "'message_template' must be of class character")
})


test_that("http fails well with malformed curl pkg response objects", {
  skip_on_cran()

  library("curl")
  expect_error(http(list()),
               "curl response list must have named elements")
  expect_error(http(list(a = 5)),
               "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http(alst), "is not TRUE")
})
