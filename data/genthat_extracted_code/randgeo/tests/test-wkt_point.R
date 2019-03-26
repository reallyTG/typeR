context("wkt_point")

test_that("wkt_point works", {
  aa <- wkt_point()

  expect_is(aa, "character")
  expect_match(aa, "POINT")
  expect_match(aa, "\\(")
  expect_match(aa, "\\)")

  xx <- as.numeric(
    strsplit(regmatches(aa, regexpr('[0-9.-]+\\s[0-9.-]+', aa)), " ")[[1]]
  )
  lng <- xx[1]
  lat <- xx[2]

  # lng is between -180 and 180
  expect_lte(abs(lng), 180)

  # lat is between -90 and 90
  expect_lte(abs(lat), 90)
})

test_that("wkt_point fails well", {
  skip_on_cran()

  expect_error(wkt_point(count = "foo"),
                         "count must be of class numeric, integer")
  expect_error(wkt_point(count = list(foo = 5)),
                         "count must be of class numeric, integer")
  expect_error(wkt_point(count = mtcars),
                         "count must be of class numeric, integer")

  expect_error(wkt_point(stuff = mtcars), "unused argument")

  expect_error(wkt_point(bbox = 4), "length\\(bbox\\) == 4 is not TRUE")

  expect_error(wkt_point(fmt = 145), "invalid 'nsmall' argument")
})
