context("wkt_polygon")

test_that("wkt_polygon works", {
  aa <- wkt_polygon()

  expect_is(aa, "character")
  expect_match(aa, "POLYGON")
  expect_match(aa, "\\(\\(")
  expect_match(aa, "\\)\\)")

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

test_that("wkt_polygon fails well", {
  skip_on_cran()

  expect_error(wkt_polygon(count = "foo"),
                         "count must be of class numeric, integer")

  expect_error(wkt_polygon(num_vertices = "Adsfdf"),
                           "num_vertices must be of class numeric, integer")

  expect_error(
    wkt_polygon(max_radial_length = mtcars),
    "max_radial_length must be of class numeric, integer")

  expect_error(wkt_polygon(stuff = mtcars), "unused argument")

  expect_error(wkt_polygon(bbox = 4), "length\\(bbox\\) == 4 is not TRUE")

  expect_error(wkt_polygon(fmt = 145), "invalid 'nsmall' argument")
})
