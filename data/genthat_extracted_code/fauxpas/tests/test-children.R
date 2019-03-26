context("http children methods")

test_that("http children methods: HTTPContinue", {
  skip_on_cran()

  library("crul")
  res <- HttpClient$new("https://httpbin.org/status/405")$get()

  aa <- HTTPMethodNotAllowed$new()
  bb <- HTTPMethodNotAllowed$new(behavior = "message")
  cc <- HTTPMethodNotAllowed$new(behavior = "warning")

  expect_error(aa$do(res), "Method Not Allowed")
  expect_message(bb$do(res), "Method Not Allowed")
  expect_warning(cc$do(res), "Method Not Allowed")

  expect_null(suppressMessages(bb$do(res)))
  #expect_null(suppressWarnings(cc$do(res)))

  expect_error(aa$do_verbose(res),
               "The method specified in the Request-Line is not allowed")
  expect_message(bb$do_verbose(res),
                 "The method specified in the Request-Line is not allowed")
  expect_warning(cc$do_verbose(res),
                 "The method specified in the Request-Line is not allowed")
})

test_that("http fails well", {
  skip_on_cran()

  expect_error(HTTPAccepted$new(behavior = 5), "is not TRUE")
  expect_error(HTTPBadGateway$new(a = "asdfadfasf"), "unused argument")
})

