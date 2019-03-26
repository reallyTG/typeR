context("build_url")

test_that("normal inputs works", {
  expect_identical(
    rgho:::build_gho_url(),
    "http://apps.who.int/gho/athena/api/GHO"
  )
  expect_identical(
    rgho:::build_gho_url(dimension = "COUNTRY"),
    "http://apps.who.int/gho/athena/api/COUNTRY"
  )
  expect_identical(
    rgho:::build_gho_url(dimension = NULL),
    "http://apps.who.int/gho/athena/api/"
  )
  expect_identical(
    rgho:::build_gho_url(base_url = "http://google.com"),
    "http://google.com/GHO"
  )
  expect_identical(
    rgho:::build_gho_url(code = "xxx"),
    "http://apps.who.int/gho/athena/api/GHO/xxx"
  )
  expect_identical(
    rgho:::build_gho_url(dimension = "COUNTRY", code = "yyy"),
    "http://apps.who.int/gho/athena/api/COUNTRY/yyy"
  )
  expect_identical(
    rgho:::build_gho_url(dimension = "COUNTRY", code = "yyy",
                         filter = list(a = 1, b = 2)),
    "http://apps.who.int/gho/athena/api/COUNTRY/yyy?filter=a%3A1%3Bb%3A2"
  )
  expect_identical(
    rgho:::build_gho_url(dimension = NULL, x=1, y=2),
    "http://apps.who.int/gho/athena/api/?x=1&y=2"
  )
  expect_identical(
    rgho:::build_gho_url(dimension = "COUNTRY", x=1, y=2),
    "http://apps.who.int/gho/athena/api/COUNTRY?x=1&y=2"
  )
  expect_identical(
    rgho:::build_gho_url(dimension = "COUNTRY", code = "xxx",
                         x=1, y=2),
    "http://apps.who.int/gho/athena/api/COUNTRY/xxx?x=1&y=2"
  )
  expect_identical(
    rgho:::build_gho_url(dimension = "COUNTRY", code = "yyy",
                         filter = list(a = 1, b = 2),
                         x=1, y=2),
    "http://apps.who.int/gho/athena/api/COUNTRY/yyy?filter=a%3A1%3Bb%3A2&x=1&y=2"
  )
})

test_that("wrong input fails", {
  expect_error(
    rgho:::build_gho_url(dimension = 1:2)
  )
  expect_error(
    rgho:::build_gho_url(dimension = NULL, code = "xxx")
  )
  expect_error(
    rgho:::build_gho_url(code = NULL, filter = list(a = 1))
  )
  expect_error(
    rgho:::build_gho_url(code = "xxx", filter = list(1))
  )
  expect_error(
    rgho:::build_gho_url(code = "xxx", filter = c(a = 1))
  )
  expect_error(
    rgho:::build_gho_url(code = "xxx", filter = list(a = 1:2))
  )
  expect_error(
    rgho:::build_gho_url(code = "xxx", filter = list())
  )
  expect_error(
    rgho:::build_gho_url(
      base_url = "http://google.com",
      dimension = "GHO",
      code = "xxx", filter = list(a = 1),
      2, 3
    )
  )
  expect_error(
    rgho:::build_gho_url(
      base_url = "http://google.com",
      dimension = "GHO",
      code = "xxx", filter = list(a = 1),
      x = 2, y = 3:4
    )
  )
  expect_error(
    rgho:::build_gho_url(
      base_url = "http://google.com",
      dimension = "GHO",
      code = "xxx", filter = list(a = 1),
      x = 2, y = NULL
    )
  )
})
