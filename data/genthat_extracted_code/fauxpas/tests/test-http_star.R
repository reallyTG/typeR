# generated from extra/generate.R
context("http* star functions")

library("crul")
load("cached_teapot.rda"); res <- cached_teapot


test_that("http100 works", {
  skip_on_cran()

  expect_message(http100(res, behavior = "message"), "I'm a teapot")
  expect_warning(http100(res, behavior = "warning"), "I'm a teapot")
  expect_error(http100(res), "I'm a teapot")

  expect_null(suppressMessages(http100(res, behavior = "message")))
})

test_that("http100 fails well", {
  skip_on_cran()

  expect_error(http100(5), "no 'http100' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http100(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http100(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http100 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http100(list()),
     "curl response list must have named elements")
  expect_error(http100(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http100(alst), "is not TRUE")
})


test_that("http101 works", {
  skip_on_cran()

  expect_message(http101(res, behavior = "message"), "I'm a teapot")
  expect_warning(http101(res, behavior = "warning"), "I'm a teapot")
  expect_error(http101(res), "I'm a teapot")

  expect_null(suppressMessages(http101(res, behavior = "message")))
})

test_that("http101 fails well", {
  skip_on_cran()

  expect_error(http101(5), "no 'http101' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http101(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http101(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http101 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http101(list()),
     "curl response list must have named elements")
  expect_error(http101(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http101(alst), "is not TRUE")
})


test_that("http102 works", {
  skip_on_cran()

  expect_message(http102(res, behavior = "message"), "I'm a teapot")
  expect_warning(http102(res, behavior = "warning"), "I'm a teapot")
  expect_error(http102(res), "I'm a teapot")

  expect_null(suppressMessages(http102(res, behavior = "message")))
})

test_that("http102 fails well", {
  skip_on_cran()

  expect_error(http102(5), "no 'http102' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http102(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http102(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http102 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http102(list()),
     "curl response list must have named elements")
  expect_error(http102(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http102(alst), "is not TRUE")
})


test_that("http200 works", {
  skip_on_cran()

  expect_message(http200(res, behavior = "message"), "I'm a teapot")
  expect_warning(http200(res, behavior = "warning"), "I'm a teapot")
  expect_error(http200(res), "I'm a teapot")

  expect_null(suppressMessages(http200(res, behavior = "message")))
})

test_that("http200 fails well", {
  skip_on_cran()

  expect_error(http200(5), "no 'http200' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http200(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http200(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http200 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http200(list()),
     "curl response list must have named elements")
  expect_error(http200(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http200(alst), "is not TRUE")
})


test_that("http201 works", {
  skip_on_cran()

  expect_message(http201(res, behavior = "message"), "I'm a teapot")
  expect_warning(http201(res, behavior = "warning"), "I'm a teapot")
  expect_error(http201(res), "I'm a teapot")

  expect_null(suppressMessages(http201(res, behavior = "message")))
})

test_that("http201 fails well", {
  skip_on_cran()

  expect_error(http201(5), "no 'http201' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http201(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http201(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http201 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http201(list()),
     "curl response list must have named elements")
  expect_error(http201(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http201(alst), "is not TRUE")
})


test_that("http202 works", {
  skip_on_cran()

  expect_message(http202(res, behavior = "message"), "I'm a teapot")
  expect_warning(http202(res, behavior = "warning"), "I'm a teapot")
  expect_error(http202(res), "I'm a teapot")

  expect_null(suppressMessages(http202(res, behavior = "message")))
})

test_that("http202 fails well", {
  skip_on_cran()

  expect_error(http202(5), "no 'http202' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http202(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http202(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http202 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http202(list()),
     "curl response list must have named elements")
  expect_error(http202(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http202(alst), "is not TRUE")
})


test_that("http203 works", {
  skip_on_cran()

  expect_message(http203(res, behavior = "message"), "I'm a teapot")
  expect_warning(http203(res, behavior = "warning"), "I'm a teapot")
  expect_error(http203(res), "I'm a teapot")

  expect_null(suppressMessages(http203(res, behavior = "message")))
})

test_that("http203 fails well", {
  skip_on_cran()

  expect_error(http203(5), "no 'http203' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http203(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http203(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http203 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http203(list()),
     "curl response list must have named elements")
  expect_error(http203(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http203(alst), "is not TRUE")
})


test_that("http204 works", {
  skip_on_cran()

  expect_message(http204(res, behavior = "message"), "I'm a teapot")
  expect_warning(http204(res, behavior = "warning"), "I'm a teapot")
  expect_error(http204(res), "I'm a teapot")

  expect_null(suppressMessages(http204(res, behavior = "message")))
})

test_that("http204 fails well", {
  skip_on_cran()

  expect_error(http204(5), "no 'http204' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http204(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http204(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http204 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http204(list()),
     "curl response list must have named elements")
  expect_error(http204(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http204(alst), "is not TRUE")
})


test_that("http205 works", {
  skip_on_cran()

  expect_message(http205(res, behavior = "message"), "I'm a teapot")
  expect_warning(http205(res, behavior = "warning"), "I'm a teapot")
  expect_error(http205(res), "I'm a teapot")

  expect_null(suppressMessages(http205(res, behavior = "message")))
})

test_that("http205 fails well", {
  skip_on_cran()

  expect_error(http205(5), "no 'http205' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http205(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http205(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http205 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http205(list()),
     "curl response list must have named elements")
  expect_error(http205(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http205(alst), "is not TRUE")
})


test_that("http206 works", {
  skip_on_cran()

  expect_message(http206(res, behavior = "message"), "I'm a teapot")
  expect_warning(http206(res, behavior = "warning"), "I'm a teapot")
  expect_error(http206(res), "I'm a teapot")

  expect_null(suppressMessages(http206(res, behavior = "message")))
})

test_that("http206 fails well", {
  skip_on_cran()

  expect_error(http206(5), "no 'http206' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http206(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http206(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http206 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http206(list()),
     "curl response list must have named elements")
  expect_error(http206(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http206(alst), "is not TRUE")
})


test_that("http207 works", {
  skip_on_cran()

  expect_message(http207(res, behavior = "message"), "I'm a teapot")
  expect_warning(http207(res, behavior = "warning"), "I'm a teapot")
  expect_error(http207(res), "I'm a teapot")

  expect_null(suppressMessages(http207(res, behavior = "message")))
})

test_that("http207 fails well", {
  skip_on_cran()

  expect_error(http207(5), "no 'http207' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http207(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http207(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http207 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http207(list()),
     "curl response list must have named elements")
  expect_error(http207(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http207(alst), "is not TRUE")
})


test_that("http208 works", {
  skip_on_cran()

  expect_message(http208(res, behavior = "message"), "I'm a teapot")
  expect_warning(http208(res, behavior = "warning"), "I'm a teapot")
  expect_error(http208(res), "I'm a teapot")

  expect_null(suppressMessages(http208(res, behavior = "message")))
})

test_that("http208 fails well", {
  skip_on_cran()

  expect_error(http208(5), "no 'http208' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http208(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http208(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http208 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http208(list()),
     "curl response list must have named elements")
  expect_error(http208(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http208(alst), "is not TRUE")
})


test_that("http226 works", {
  skip_on_cran()

  expect_message(http226(res, behavior = "message"), "I'm a teapot")
  expect_warning(http226(res, behavior = "warning"), "I'm a teapot")
  expect_error(http226(res), "I'm a teapot")

  expect_null(suppressMessages(http226(res, behavior = "message")))
})

test_that("http226 fails well", {
  skip_on_cran()

  expect_error(http226(5), "no 'http226' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http226(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http226(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http226 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http226(list()),
     "curl response list must have named elements")
  expect_error(http226(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http226(alst), "is not TRUE")
})


test_that("http300 works", {
  skip_on_cran()

  expect_message(http300(res, behavior = "message"), "I'm a teapot")
  expect_warning(http300(res, behavior = "warning"), "I'm a teapot")
  expect_error(http300(res), "I'm a teapot")

  expect_null(suppressMessages(http300(res, behavior = "message")))
})

test_that("http300 fails well", {
  skip_on_cran()

  expect_error(http300(5), "no 'http300' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http300(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http300(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http300 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http300(list()),
     "curl response list must have named elements")
  expect_error(http300(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http300(alst), "is not TRUE")
})


test_that("http301 works", {
  skip_on_cran()

  expect_message(http301(res, behavior = "message"), "I'm a teapot")
  expect_warning(http301(res, behavior = "warning"), "I'm a teapot")
  expect_error(http301(res), "I'm a teapot")

  expect_null(suppressMessages(http301(res, behavior = "message")))
})

test_that("http301 fails well", {
  skip_on_cran()

  expect_error(http301(5), "no 'http301' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http301(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http301(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http301 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http301(list()),
     "curl response list must have named elements")
  expect_error(http301(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http301(alst), "is not TRUE")
})


test_that("http302 works", {
  skip_on_cran()

  expect_message(http302(res, behavior = "message"), "I'm a teapot")
  expect_warning(http302(res, behavior = "warning"), "I'm a teapot")
  expect_error(http302(res), "I'm a teapot")

  expect_null(suppressMessages(http302(res, behavior = "message")))
})

test_that("http302 fails well", {
  skip_on_cran()

  expect_error(http302(5), "no 'http302' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http302(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http302(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http302 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http302(list()),
     "curl response list must have named elements")
  expect_error(http302(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http302(alst), "is not TRUE")
})


test_that("http303 works", {
  skip_on_cran()

  expect_message(http303(res, behavior = "message"), "I'm a teapot")
  expect_warning(http303(res, behavior = "warning"), "I'm a teapot")
  expect_error(http303(res), "I'm a teapot")

  expect_null(suppressMessages(http303(res, behavior = "message")))
})

test_that("http303 fails well", {
  skip_on_cran()

  expect_error(http303(5), "no 'http303' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http303(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http303(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http303 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http303(list()),
     "curl response list must have named elements")
  expect_error(http303(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http303(alst), "is not TRUE")
})


test_that("http304 works", {
  skip_on_cran()

  expect_message(http304(res, behavior = "message"), "I'm a teapot")
  expect_warning(http304(res, behavior = "warning"), "I'm a teapot")
  expect_error(http304(res), "I'm a teapot")

  expect_null(suppressMessages(http304(res, behavior = "message")))
})

test_that("http304 fails well", {
  skip_on_cran()

  expect_error(http304(5), "no 'http304' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http304(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http304(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http304 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http304(list()),
     "curl response list must have named elements")
  expect_error(http304(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http304(alst), "is not TRUE")
})


test_that("http305 works", {
  skip_on_cran()

  expect_message(http305(res, behavior = "message"), "I'm a teapot")
  expect_warning(http305(res, behavior = "warning"), "I'm a teapot")
  expect_error(http305(res), "I'm a teapot")

  expect_null(suppressMessages(http305(res, behavior = "message")))
})

test_that("http305 fails well", {
  skip_on_cran()

  expect_error(http305(5), "no 'http305' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http305(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http305(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http305 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http305(list()),
     "curl response list must have named elements")
  expect_error(http305(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http305(alst), "is not TRUE")
})


test_that("http306 works", {
  skip_on_cran()

  expect_message(http306(res, behavior = "message"), "I'm a teapot")
  expect_warning(http306(res, behavior = "warning"), "I'm a teapot")
  expect_error(http306(res), "I'm a teapot")

  expect_null(suppressMessages(http306(res, behavior = "message")))
})

test_that("http306 fails well", {
  skip_on_cran()

  expect_error(http306(5), "no 'http306' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http306(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http306(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http306 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http306(list()),
     "curl response list must have named elements")
  expect_error(http306(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http306(alst), "is not TRUE")
})


test_that("http307 works", {
  skip_on_cran()

  expect_message(http307(res, behavior = "message"), "I'm a teapot")
  expect_warning(http307(res, behavior = "warning"), "I'm a teapot")
  expect_error(http307(res), "I'm a teapot")

  expect_null(suppressMessages(http307(res, behavior = "message")))
})

test_that("http307 fails well", {
  skip_on_cran()

  expect_error(http307(5), "no 'http307' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http307(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http307(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http307 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http307(list()),
     "curl response list must have named elements")
  expect_error(http307(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http307(alst), "is not TRUE")
})


test_that("http308 works", {
  skip_on_cran()

  expect_message(http308(res, behavior = "message"), "I'm a teapot")
  expect_warning(http308(res, behavior = "warning"), "I'm a teapot")
  expect_error(http308(res), "I'm a teapot")

  expect_null(suppressMessages(http308(res, behavior = "message")))
})

test_that("http308 fails well", {
  skip_on_cran()

  expect_error(http308(5), "no 'http308' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http308(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http308(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http308 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http308(list()),
     "curl response list must have named elements")
  expect_error(http308(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http308(alst), "is not TRUE")
})


test_that("http400 works", {
  skip_on_cran()

  expect_message(http400(res, behavior = "message"), "I'm a teapot")
  expect_warning(http400(res, behavior = "warning"), "I'm a teapot")
  expect_error(http400(res), "I'm a teapot")

  expect_null(suppressMessages(http400(res, behavior = "message")))
})

test_that("http400 fails well", {
  skip_on_cran()

  expect_error(http400(5), "no 'http400' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http400(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http400(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http400 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http400(list()),
     "curl response list must have named elements")
  expect_error(http400(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http400(alst), "is not TRUE")
})


test_that("http401 works", {
  skip_on_cran()

  expect_message(http401(res, behavior = "message"), "I'm a teapot")
  expect_warning(http401(res, behavior = "warning"), "I'm a teapot")
  expect_error(http401(res), "I'm a teapot")

  expect_null(suppressMessages(http401(res, behavior = "message")))
})

test_that("http401 fails well", {
  skip_on_cran()

  expect_error(http401(5), "no 'http401' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http401(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http401(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http401 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http401(list()),
     "curl response list must have named elements")
  expect_error(http401(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http401(alst), "is not TRUE")
})


test_that("http402 works", {
  skip_on_cran()

  expect_message(http402(res, behavior = "message"), "I'm a teapot")
  expect_warning(http402(res, behavior = "warning"), "I'm a teapot")
  expect_error(http402(res), "I'm a teapot")

  expect_null(suppressMessages(http402(res, behavior = "message")))
})

test_that("http402 fails well", {
  skip_on_cran()

  expect_error(http402(5), "no 'http402' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http402(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http402(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http402 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http402(list()),
     "curl response list must have named elements")
  expect_error(http402(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http402(alst), "is not TRUE")
})


test_that("http403 works", {
  skip_on_cran()

  expect_message(http403(res, behavior = "message"), "I'm a teapot")
  expect_warning(http403(res, behavior = "warning"), "I'm a teapot")
  expect_error(http403(res), "I'm a teapot")

  expect_null(suppressMessages(http403(res, behavior = "message")))
})

test_that("http403 fails well", {
  skip_on_cran()

  expect_error(http403(5), "no 'http403' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http403(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http403(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http403 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http403(list()),
     "curl response list must have named elements")
  expect_error(http403(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http403(alst), "is not TRUE")
})


test_that("http404 works", {
  skip_on_cran()

  expect_message(http404(res, behavior = "message"), "I'm a teapot")
  expect_warning(http404(res, behavior = "warning"), "I'm a teapot")
  expect_error(http404(res), "I'm a teapot")

  expect_null(suppressMessages(http404(res, behavior = "message")))
})

test_that("http404 fails well", {
  skip_on_cran()

  expect_error(http404(5), "no 'http404' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http404(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http404(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http404 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http404(list()),
     "curl response list must have named elements")
  expect_error(http404(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http404(alst), "is not TRUE")
})


test_that("http405 works", {
  skip_on_cran()

  expect_message(http405(res, behavior = "message"), "I'm a teapot")
  expect_warning(http405(res, behavior = "warning"), "I'm a teapot")
  expect_error(http405(res), "I'm a teapot")

  expect_null(suppressMessages(http405(res, behavior = "message")))
})

test_that("http405 fails well", {
  skip_on_cran()

  expect_error(http405(5), "no 'http405' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http405(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http405(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http405 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http405(list()),
     "curl response list must have named elements")
  expect_error(http405(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http405(alst), "is not TRUE")
})


test_that("http406 works", {
  skip_on_cran()

  expect_message(http406(res, behavior = "message"), "I'm a teapot")
  expect_warning(http406(res, behavior = "warning"), "I'm a teapot")
  expect_error(http406(res), "I'm a teapot")

  expect_null(suppressMessages(http406(res, behavior = "message")))
})

test_that("http406 fails well", {
  skip_on_cran()

  expect_error(http406(5), "no 'http406' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http406(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http406(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http406 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http406(list()),
     "curl response list must have named elements")
  expect_error(http406(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http406(alst), "is not TRUE")
})


test_that("http407 works", {
  skip_on_cran()

  expect_message(http407(res, behavior = "message"), "I'm a teapot")
  expect_warning(http407(res, behavior = "warning"), "I'm a teapot")
  expect_error(http407(res), "I'm a teapot")

  expect_null(suppressMessages(http407(res, behavior = "message")))
})

test_that("http407 fails well", {
  skip_on_cran()

  expect_error(http407(5), "no 'http407' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http407(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http407(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http407 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http407(list()),
     "curl response list must have named elements")
  expect_error(http407(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http407(alst), "is not TRUE")
})


test_that("http408 works", {
  skip_on_cran()

  expect_message(http408(res, behavior = "message"), "I'm a teapot")
  expect_warning(http408(res, behavior = "warning"), "I'm a teapot")
  expect_error(http408(res), "I'm a teapot")

  expect_null(suppressMessages(http408(res, behavior = "message")))
})

test_that("http408 fails well", {
  skip_on_cran()

  expect_error(http408(5), "no 'http408' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http408(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http408(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http408 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http408(list()),
     "curl response list must have named elements")
  expect_error(http408(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http408(alst), "is not TRUE")
})


test_that("http409 works", {
  skip_on_cran()

  expect_message(http409(res, behavior = "message"), "I'm a teapot")
  expect_warning(http409(res, behavior = "warning"), "I'm a teapot")
  expect_error(http409(res), "I'm a teapot")

  expect_null(suppressMessages(http409(res, behavior = "message")))
})

test_that("http409 fails well", {
  skip_on_cran()

  expect_error(http409(5), "no 'http409' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http409(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http409(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http409 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http409(list()),
     "curl response list must have named elements")
  expect_error(http409(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http409(alst), "is not TRUE")
})


test_that("http410 works", {
  skip_on_cran()

  expect_message(http410(res, behavior = "message"), "I'm a teapot")
  expect_warning(http410(res, behavior = "warning"), "I'm a teapot")
  expect_error(http410(res), "I'm a teapot")

  expect_null(suppressMessages(http410(res, behavior = "message")))
})

test_that("http410 fails well", {
  skip_on_cran()

  expect_error(http410(5), "no 'http410' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http410(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http410(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http410 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http410(list()),
     "curl response list must have named elements")
  expect_error(http410(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http410(alst), "is not TRUE")
})


test_that("http411 works", {
  skip_on_cran()

  expect_message(http411(res, behavior = "message"), "I'm a teapot")
  expect_warning(http411(res, behavior = "warning"), "I'm a teapot")
  expect_error(http411(res), "I'm a teapot")

  expect_null(suppressMessages(http411(res, behavior = "message")))
})

test_that("http411 fails well", {
  skip_on_cran()

  expect_error(http411(5), "no 'http411' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http411(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http411(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http411 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http411(list()),
     "curl response list must have named elements")
  expect_error(http411(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http411(alst), "is not TRUE")
})


test_that("http412 works", {
  skip_on_cran()

  expect_message(http412(res, behavior = "message"), "I'm a teapot")
  expect_warning(http412(res, behavior = "warning"), "I'm a teapot")
  expect_error(http412(res), "I'm a teapot")

  expect_null(suppressMessages(http412(res, behavior = "message")))
})

test_that("http412 fails well", {
  skip_on_cran()

  expect_error(http412(5), "no 'http412' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http412(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http412(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http412 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http412(list()),
     "curl response list must have named elements")
  expect_error(http412(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http412(alst), "is not TRUE")
})


test_that("http413 works", {
  skip_on_cran()

  expect_message(http413(res, behavior = "message"), "I'm a teapot")
  expect_warning(http413(res, behavior = "warning"), "I'm a teapot")
  expect_error(http413(res), "I'm a teapot")

  expect_null(suppressMessages(http413(res, behavior = "message")))
})

test_that("http413 fails well", {
  skip_on_cran()

  expect_error(http413(5), "no 'http413' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http413(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http413(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http413 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http413(list()),
     "curl response list must have named elements")
  expect_error(http413(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http413(alst), "is not TRUE")
})


test_that("http414 works", {
  skip_on_cran()

  expect_message(http414(res, behavior = "message"), "I'm a teapot")
  expect_warning(http414(res, behavior = "warning"), "I'm a teapot")
  expect_error(http414(res), "I'm a teapot")

  expect_null(suppressMessages(http414(res, behavior = "message")))
})

test_that("http414 fails well", {
  skip_on_cran()

  expect_error(http414(5), "no 'http414' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http414(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http414(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http414 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http414(list()),
     "curl response list must have named elements")
  expect_error(http414(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http414(alst), "is not TRUE")
})


test_that("http415 works", {
  skip_on_cran()

  expect_message(http415(res, behavior = "message"), "I'm a teapot")
  expect_warning(http415(res, behavior = "warning"), "I'm a teapot")
  expect_error(http415(res), "I'm a teapot")

  expect_null(suppressMessages(http415(res, behavior = "message")))
})

test_that("http415 fails well", {
  skip_on_cran()

  expect_error(http415(5), "no 'http415' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http415(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http415(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http415 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http415(list()),
     "curl response list must have named elements")
  expect_error(http415(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http415(alst), "is not TRUE")
})


test_that("http416 works", {
  skip_on_cran()

  expect_message(http416(res, behavior = "message"), "I'm a teapot")
  expect_warning(http416(res, behavior = "warning"), "I'm a teapot")
  expect_error(http416(res), "I'm a teapot")

  expect_null(suppressMessages(http416(res, behavior = "message")))
})

test_that("http416 fails well", {
  skip_on_cran()

  expect_error(http416(5), "no 'http416' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http416(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http416(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http416 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http416(list()),
     "curl response list must have named elements")
  expect_error(http416(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http416(alst), "is not TRUE")
})


test_that("http417 works", {
  skip_on_cran()

  expect_message(http417(res, behavior = "message"), "I'm a teapot")
  expect_warning(http417(res, behavior = "warning"), "I'm a teapot")
  expect_error(http417(res), "I'm a teapot")

  expect_null(suppressMessages(http417(res, behavior = "message")))
})

test_that("http417 fails well", {
  skip_on_cran()

  expect_error(http417(5), "no 'http417' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http417(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http417(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http417 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http417(list()),
     "curl response list must have named elements")
  expect_error(http417(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http417(alst), "is not TRUE")
})


test_that("http418 works", {
  skip_on_cran()

  expect_message(http418(res, behavior = "message"), "I'm a teapot")
  expect_warning(http418(res, behavior = "warning"), "I'm a teapot")
  expect_error(http418(res), "I'm a teapot")

  expect_null(suppressMessages(http418(res, behavior = "message")))
})

test_that("http418 fails well", {
  skip_on_cran()

  expect_error(http418(5), "no 'http418' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http418(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http418(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http418 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http418(list()),
     "curl response list must have named elements")
  expect_error(http418(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http418(alst), "is not TRUE")
})


test_that("http419 works", {
  skip_on_cran()

  expect_message(http419(res, behavior = "message"), "I'm a teapot")
  expect_warning(http419(res, behavior = "warning"), "I'm a teapot")
  expect_error(http419(res), "I'm a teapot")

  expect_null(suppressMessages(http419(res, behavior = "message")))
})

test_that("http419 fails well", {
  skip_on_cran()

  expect_error(http419(5), "no 'http419' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http419(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http419(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http419 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http419(list()),
     "curl response list must have named elements")
  expect_error(http419(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http419(alst), "is not TRUE")
})


test_that("http420 works", {
  skip_on_cran()

  expect_message(http420(res, behavior = "message"), "I'm a teapot")
  expect_warning(http420(res, behavior = "warning"), "I'm a teapot")
  expect_error(http420(res), "I'm a teapot")

  expect_null(suppressMessages(http420(res, behavior = "message")))
})

test_that("http420 fails well", {
  skip_on_cran()

  expect_error(http420(5), "no 'http420' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http420(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http420(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http420 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http420(list()),
     "curl response list must have named elements")
  expect_error(http420(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http420(alst), "is not TRUE")
})


test_that("http422 works", {
  skip_on_cran()

  expect_message(http422(res, behavior = "message"), "I'm a teapot")
  expect_warning(http422(res, behavior = "warning"), "I'm a teapot")
  expect_error(http422(res), "I'm a teapot")

  expect_null(suppressMessages(http422(res, behavior = "message")))
})

test_that("http422 fails well", {
  skip_on_cran()

  expect_error(http422(5), "no 'http422' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http422(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http422(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http422 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http422(list()),
     "curl response list must have named elements")
  expect_error(http422(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http422(alst), "is not TRUE")
})


test_that("http423 works", {
  skip_on_cran()

  expect_message(http423(res, behavior = "message"), "I'm a teapot")
  expect_warning(http423(res, behavior = "warning"), "I'm a teapot")
  expect_error(http423(res), "I'm a teapot")

  expect_null(suppressMessages(http423(res, behavior = "message")))
})

test_that("http423 fails well", {
  skip_on_cran()

  expect_error(http423(5), "no 'http423' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http423(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http423(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http423 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http423(list()),
     "curl response list must have named elements")
  expect_error(http423(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http423(alst), "is not TRUE")
})


test_that("http424 works", {
  skip_on_cran()

  expect_message(http424(res, behavior = "message"), "I'm a teapot")
  expect_warning(http424(res, behavior = "warning"), "I'm a teapot")
  expect_error(http424(res), "I'm a teapot")

  expect_null(suppressMessages(http424(res, behavior = "message")))
})

test_that("http424 fails well", {
  skip_on_cran()

  expect_error(http424(5), "no 'http424' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http424(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http424(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http424 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http424(list()),
     "curl response list must have named elements")
  expect_error(http424(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http424(alst), "is not TRUE")
})


test_that("http425 works", {
  skip_on_cran()

  expect_message(http425(res, behavior = "message"), "I'm a teapot")
  expect_warning(http425(res, behavior = "warning"), "I'm a teapot")
  expect_error(http425(res), "I'm a teapot")

  expect_null(suppressMessages(http425(res, behavior = "message")))
})

test_that("http425 fails well", {
  skip_on_cran()

  expect_error(http425(5), "no 'http425' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http425(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http425(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http425 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http425(list()),
     "curl response list must have named elements")
  expect_error(http425(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http425(alst), "is not TRUE")
})


test_that("http426 works", {
  skip_on_cran()

  expect_message(http426(res, behavior = "message"), "I'm a teapot")
  expect_warning(http426(res, behavior = "warning"), "I'm a teapot")
  expect_error(http426(res), "I'm a teapot")

  expect_null(suppressMessages(http426(res, behavior = "message")))
})

test_that("http426 fails well", {
  skip_on_cran()

  expect_error(http426(5), "no 'http426' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http426(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http426(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http426 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http426(list()),
     "curl response list must have named elements")
  expect_error(http426(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http426(alst), "is not TRUE")
})


test_that("http428 works", {
  skip_on_cran()

  expect_message(http428(res, behavior = "message"), "I'm a teapot")
  expect_warning(http428(res, behavior = "warning"), "I'm a teapot")
  expect_error(http428(res), "I'm a teapot")

  expect_null(suppressMessages(http428(res, behavior = "message")))
})

test_that("http428 fails well", {
  skip_on_cran()

  expect_error(http428(5), "no 'http428' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http428(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http428(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http428 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http428(list()),
     "curl response list must have named elements")
  expect_error(http428(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http428(alst), "is not TRUE")
})


test_that("http429 works", {
  skip_on_cran()

  expect_message(http429(res, behavior = "message"), "I'm a teapot")
  expect_warning(http429(res, behavior = "warning"), "I'm a teapot")
  expect_error(http429(res), "I'm a teapot")

  expect_null(suppressMessages(http429(res, behavior = "message")))
})

test_that("http429 fails well", {
  skip_on_cran()

  expect_error(http429(5), "no 'http429' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http429(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http429(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http429 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http429(list()),
     "curl response list must have named elements")
  expect_error(http429(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http429(alst), "is not TRUE")
})


test_that("http431 works", {
  skip_on_cran()

  expect_message(http431(res, behavior = "message"), "I'm a teapot")
  expect_warning(http431(res, behavior = "warning"), "I'm a teapot")
  expect_error(http431(res), "I'm a teapot")

  expect_null(suppressMessages(http431(res, behavior = "message")))
})

test_that("http431 fails well", {
  skip_on_cran()

  expect_error(http431(5), "no 'http431' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http431(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http431(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http431 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http431(list()),
     "curl response list must have named elements")
  expect_error(http431(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http431(alst), "is not TRUE")
})


test_that("http440 works", {
  skip_on_cran()

  expect_message(http440(res, behavior = "message"), "I'm a teapot")
  expect_warning(http440(res, behavior = "warning"), "I'm a teapot")
  expect_error(http440(res), "I'm a teapot")

  expect_null(suppressMessages(http440(res, behavior = "message")))
})

test_that("http440 fails well", {
  skip_on_cran()

  expect_error(http440(5), "no 'http440' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http440(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http440(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http440 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http440(list()),
     "curl response list must have named elements")
  expect_error(http440(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http440(alst), "is not TRUE")
})


test_that("http444 works", {
  skip_on_cran()

  expect_message(http444(res, behavior = "message"), "I'm a teapot")
  expect_warning(http444(res, behavior = "warning"), "I'm a teapot")
  expect_error(http444(res), "I'm a teapot")

  expect_null(suppressMessages(http444(res, behavior = "message")))
})

test_that("http444 fails well", {
  skip_on_cran()

  expect_error(http444(5), "no 'http444' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http444(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http444(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http444 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http444(list()),
     "curl response list must have named elements")
  expect_error(http444(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http444(alst), "is not TRUE")
})


test_that("http449 works", {
  skip_on_cran()

  expect_message(http449(res, behavior = "message"), "I'm a teapot")
  expect_warning(http449(res, behavior = "warning"), "I'm a teapot")
  expect_error(http449(res), "I'm a teapot")

  expect_null(suppressMessages(http449(res, behavior = "message")))
})

test_that("http449 fails well", {
  skip_on_cran()

  expect_error(http449(5), "no 'http449' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http449(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http449(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http449 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http449(list()),
     "curl response list must have named elements")
  expect_error(http449(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http449(alst), "is not TRUE")
})


test_that("http450 works", {
  skip_on_cran()

  expect_message(http450(res, behavior = "message"), "I'm a teapot")
  expect_warning(http450(res, behavior = "warning"), "I'm a teapot")
  expect_error(http450(res), "I'm a teapot")

  expect_null(suppressMessages(http450(res, behavior = "message")))
})

test_that("http450 fails well", {
  skip_on_cran()

  expect_error(http450(5), "no 'http450' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http450(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http450(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http450 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http450(list()),
     "curl response list must have named elements")
  expect_error(http450(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http450(alst), "is not TRUE")
})


test_that("http451 works", {
  skip_on_cran()

  expect_message(http451(res, behavior = "message"), "I'm a teapot")
  expect_warning(http451(res, behavior = "warning"), "I'm a teapot")
  expect_error(http451(res), "I'm a teapot")

  expect_null(suppressMessages(http451(res, behavior = "message")))
})

test_that("http451 fails well", {
  skip_on_cran()

  expect_error(http451(5), "no 'http451' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http451(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http451(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http451 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http451(list()),
     "curl response list must have named elements")
  expect_error(http451(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http451(alst), "is not TRUE")
})


test_that("http494 works", {
  skip_on_cran()

  expect_message(http494(res, behavior = "message"), "I'm a teapot")
  expect_warning(http494(res, behavior = "warning"), "I'm a teapot")
  expect_error(http494(res), "I'm a teapot")

  expect_null(suppressMessages(http494(res, behavior = "message")))
})

test_that("http494 fails well", {
  skip_on_cran()

  expect_error(http494(5), "no 'http494' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http494(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http494(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http494 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http494(list()),
     "curl response list must have named elements")
  expect_error(http494(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http494(alst), "is not TRUE")
})


test_that("http495 works", {
  skip_on_cran()

  expect_message(http495(res, behavior = "message"), "I'm a teapot")
  expect_warning(http495(res, behavior = "warning"), "I'm a teapot")
  expect_error(http495(res), "I'm a teapot")

  expect_null(suppressMessages(http495(res, behavior = "message")))
})

test_that("http495 fails well", {
  skip_on_cran()

  expect_error(http495(5), "no 'http495' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http495(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http495(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http495 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http495(list()),
     "curl response list must have named elements")
  expect_error(http495(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http495(alst), "is not TRUE")
})


test_that("http496 works", {
  skip_on_cran()

  expect_message(http496(res, behavior = "message"), "I'm a teapot")
  expect_warning(http496(res, behavior = "warning"), "I'm a teapot")
  expect_error(http496(res), "I'm a teapot")

  expect_null(suppressMessages(http496(res, behavior = "message")))
})

test_that("http496 fails well", {
  skip_on_cran()

  expect_error(http496(5), "no 'http496' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http496(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http496(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http496 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http496(list()),
     "curl response list must have named elements")
  expect_error(http496(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http496(alst), "is not TRUE")
})


test_that("http497 works", {
  skip_on_cran()

  expect_message(http497(res, behavior = "message"), "I'm a teapot")
  expect_warning(http497(res, behavior = "warning"), "I'm a teapot")
  expect_error(http497(res), "I'm a teapot")

  expect_null(suppressMessages(http497(res, behavior = "message")))
})

test_that("http497 fails well", {
  skip_on_cran()

  expect_error(http497(5), "no 'http497' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http497(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http497(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http497 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http497(list()),
     "curl response list must have named elements")
  expect_error(http497(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http497(alst), "is not TRUE")
})


test_that("http498 works", {
  skip_on_cran()

  expect_message(http498(res, behavior = "message"), "I'm a teapot")
  expect_warning(http498(res, behavior = "warning"), "I'm a teapot")
  expect_error(http498(res), "I'm a teapot")

  expect_null(suppressMessages(http498(res, behavior = "message")))
})

test_that("http498 fails well", {
  skip_on_cran()

  expect_error(http498(5), "no 'http498' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http498(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http498(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http498 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http498(list()),
     "curl response list must have named elements")
  expect_error(http498(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http498(alst), "is not TRUE")
})


test_that("http499 works", {
  skip_on_cran()

  expect_message(http499(res, behavior = "message"), "I'm a teapot")
  expect_warning(http499(res, behavior = "warning"), "I'm a teapot")
  expect_error(http499(res), "I'm a teapot")

  expect_null(suppressMessages(http499(res, behavior = "message")))
})

test_that("http499 fails well", {
  skip_on_cran()

  expect_error(http499(5), "no 'http499' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http499(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http499(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http499 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http499(list()),
     "curl response list must have named elements")
  expect_error(http499(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http499(alst), "is not TRUE")
})


test_that("http500 works", {
  skip_on_cran()

  expect_message(http500(res, behavior = "message"), "I'm a teapot")
  expect_warning(http500(res, behavior = "warning"), "I'm a teapot")
  expect_error(http500(res), "I'm a teapot")

  expect_null(suppressMessages(http500(res, behavior = "message")))
})

test_that("http500 fails well", {
  skip_on_cran()

  expect_error(http500(5), "no 'http500' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http500(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http500(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http500 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http500(list()),
     "curl response list must have named elements")
  expect_error(http500(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http500(alst), "is not TRUE")
})


test_that("http501 works", {
  skip_on_cran()

  expect_message(http501(res, behavior = "message"), "I'm a teapot")
  expect_warning(http501(res, behavior = "warning"), "I'm a teapot")
  expect_error(http501(res), "I'm a teapot")

  expect_null(suppressMessages(http501(res, behavior = "message")))
})

test_that("http501 fails well", {
  skip_on_cran()

  expect_error(http501(5), "no 'http501' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http501(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http501(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http501 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http501(list()),
     "curl response list must have named elements")
  expect_error(http501(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http501(alst), "is not TRUE")
})


test_that("http502 works", {
  skip_on_cran()

  expect_message(http502(res, behavior = "message"), "I'm a teapot")
  expect_warning(http502(res, behavior = "warning"), "I'm a teapot")
  expect_error(http502(res), "I'm a teapot")

  expect_null(suppressMessages(http502(res, behavior = "message")))
})

test_that("http502 fails well", {
  skip_on_cran()

  expect_error(http502(5), "no 'http502' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http502(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http502(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http502 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http502(list()),
     "curl response list must have named elements")
  expect_error(http502(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http502(alst), "is not TRUE")
})


test_that("http503 works", {
  skip_on_cran()

  expect_message(http503(res, behavior = "message"), "I'm a teapot")
  expect_warning(http503(res, behavior = "warning"), "I'm a teapot")
  expect_error(http503(res), "I'm a teapot")

  expect_null(suppressMessages(http503(res, behavior = "message")))
})

test_that("http503 fails well", {
  skip_on_cran()

  expect_error(http503(5), "no 'http503' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http503(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http503(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http503 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http503(list()),
     "curl response list must have named elements")
  expect_error(http503(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http503(alst), "is not TRUE")
})


test_that("http504 works", {
  skip_on_cran()

  expect_message(http504(res, behavior = "message"), "I'm a teapot")
  expect_warning(http504(res, behavior = "warning"), "I'm a teapot")
  expect_error(http504(res), "I'm a teapot")

  expect_null(suppressMessages(http504(res, behavior = "message")))
})

test_that("http504 fails well", {
  skip_on_cran()

  expect_error(http504(5), "no 'http504' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http504(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http504(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http504 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http504(list()),
     "curl response list must have named elements")
  expect_error(http504(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http504(alst), "is not TRUE")
})


test_that("http505 works", {
  skip_on_cran()

  expect_message(http505(res, behavior = "message"), "I'm a teapot")
  expect_warning(http505(res, behavior = "warning"), "I'm a teapot")
  expect_error(http505(res), "I'm a teapot")

  expect_null(suppressMessages(http505(res, behavior = "message")))
})

test_that("http505 fails well", {
  skip_on_cran()

  expect_error(http505(5), "no 'http505' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http505(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http505(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http505 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http505(list()),
     "curl response list must have named elements")
  expect_error(http505(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http505(alst), "is not TRUE")
})


test_that("http506 works", {
  skip_on_cran()

  expect_message(http506(res, behavior = "message"), "I'm a teapot")
  expect_warning(http506(res, behavior = "warning"), "I'm a teapot")
  expect_error(http506(res), "I'm a teapot")

  expect_null(suppressMessages(http506(res, behavior = "message")))
})

test_that("http506 fails well", {
  skip_on_cran()

  expect_error(http506(5), "no 'http506' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http506(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http506(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http506 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http506(list()),
     "curl response list must have named elements")
  expect_error(http506(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http506(alst), "is not TRUE")
})


test_that("http507 works", {
  skip_on_cran()

  expect_message(http507(res, behavior = "message"), "I'm a teapot")
  expect_warning(http507(res, behavior = "warning"), "I'm a teapot")
  expect_error(http507(res), "I'm a teapot")

  expect_null(suppressMessages(http507(res, behavior = "message")))
})

test_that("http507 fails well", {
  skip_on_cran()

  expect_error(http507(5), "no 'http507' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http507(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http507(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http507 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http507(list()),
     "curl response list must have named elements")
  expect_error(http507(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http507(alst), "is not TRUE")
})


test_that("http508 works", {
  skip_on_cran()

  expect_message(http508(res, behavior = "message"), "I'm a teapot")
  expect_warning(http508(res, behavior = "warning"), "I'm a teapot")
  expect_error(http508(res), "I'm a teapot")

  expect_null(suppressMessages(http508(res, behavior = "message")))
})

test_that("http508 fails well", {
  skip_on_cran()

  expect_error(http508(5), "no 'http508' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http508(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http508(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http508 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http508(list()),
     "curl response list must have named elements")
  expect_error(http508(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http508(alst), "is not TRUE")
})


test_that("http509 works", {
  skip_on_cran()

  expect_message(http509(res, behavior = "message"), "I'm a teapot")
  expect_warning(http509(res, behavior = "warning"), "I'm a teapot")
  expect_error(http509(res), "I'm a teapot")

  expect_null(suppressMessages(http509(res, behavior = "message")))
})

test_that("http509 fails well", {
  skip_on_cran()

  expect_error(http509(5), "no 'http509' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http509(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http509(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http509 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http509(list()),
     "curl response list must have named elements")
  expect_error(http509(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http509(alst), "is not TRUE")
})


test_that("http510 works", {
  skip_on_cran()

  expect_message(http510(res, behavior = "message"), "I'm a teapot")
  expect_warning(http510(res, behavior = "warning"), "I'm a teapot")
  expect_error(http510(res), "I'm a teapot")

  expect_null(suppressMessages(http510(res, behavior = "message")))
})

test_that("http510 fails well", {
  skip_on_cran()

  expect_error(http510(5), "no 'http510' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http510(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http510(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http510 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http510(list()),
     "curl response list must have named elements")
  expect_error(http510(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http510(alst), "is not TRUE")
})


test_that("http511 works", {
  skip_on_cran()

  expect_message(http511(res, behavior = "message"), "I'm a teapot")
  expect_warning(http511(res, behavior = "warning"), "I'm a teapot")
  expect_error(http511(res), "I'm a teapot")

  expect_null(suppressMessages(http511(res, behavior = "message")))
})

test_that("http511 fails well", {
  skip_on_cran()

  expect_error(http511(5), "no 'http511' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http511(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http511(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http511 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http511(list()),
     "curl response list must have named elements")
  expect_error(http511(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http511(alst), "is not TRUE")
})


test_that("http598 works", {
  skip_on_cran()

  expect_message(http598(res, behavior = "message"), "I'm a teapot")
  expect_warning(http598(res, behavior = "warning"), "I'm a teapot")
  expect_error(http598(res), "I'm a teapot")

  expect_null(suppressMessages(http598(res, behavior = "message")))
})

test_that("http598 fails well", {
  skip_on_cran()

  expect_error(http598(5), "no 'http598' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http598(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http598(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http598 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http598(list()),
     "curl response list must have named elements")
  expect_error(http598(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http598(alst), "is not TRUE")
})


test_that("http599 works", {
  skip_on_cran()

  expect_message(http599(res, behavior = "message"), "I'm a teapot")
  expect_warning(http599(res, behavior = "warning"), "I'm a teapot")
  expect_error(http599(res), "I'm a teapot")

  expect_null(suppressMessages(http599(res, behavior = "message")))
})

test_that("http599 fails well", {
  skip_on_cran()

  expect_error(http599(5), "no 'http599' method for numeric")

  res <- HttpClient$new("https://httpbin.org/status/418")$get()

  # behavior fails well
  expect_error(http599(res, behavior = "asdfasdf"),
     "'behavior' must be one of")

  # message_template fails well
  expect_error(http599(res, message_template = 5),
     "'message_template' must be of class character")
})

test_that("http599 fails well with malformed curl pkg response objects", {
  skip_on_cran()

  expect_error(http599(list()),
     "curl response list must have named elements")
  expect_error(http599(list(a = 5)),
     "found list names 'a' - indicating input not likely a")
  alst <- list(url=5, status_code=5, headers=5, modified=5, times=5)
  expect_error(http599(alst), "is not TRUE")
})

