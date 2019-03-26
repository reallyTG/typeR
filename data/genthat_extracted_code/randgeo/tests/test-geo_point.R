context("geo_point")

test_that("geo_point works", {
  aa <- geo_point()

  expect_is(aa, "geo_list")
  expect_is(unclass(aa), "list")
  expect_equal(aa$type, "FeatureCollection")
  expect_is(aa$features, "list")
  expect_is(aa$features[[1]], "list")
  expect_null(aa$features[[1]]$properties)
  expect_equal(aa$features[[1]]$type, "Feature")

  expect_is(aa$features[[1]]$geometry$coordinates, "numeric")
  expect_type(aa$features[[1]]$geometry$coordinates, "double")
  expect_equal(length(aa$features[[1]]$geometry$coordinates), 2)

  coord <- aa$features[[1]]$geometry$coordinates

  # lng is between -180 and 180
  expect_lte(abs(coord[1]), 180)

  # lat is between -90 and 90
  expect_lte(abs(coord[2]), 90)
})

test_that("geo_point fails well", {
  skip_on_cran()

  expect_error(geo_point(count = "foo"),
                         "count must be of class numeric, integer")
  expect_error(geo_point(count = list(foo = 5)),
                         "count must be of class numeric, integer")
  expect_error(geo_point(count = mtcars),
                         "count must be of class numeric, integer")

  expect_error(geo_point(stuff = mtcars), "unused argument")

  expect_error(geo_point(bbox = 4), "length\\(bbox\\) == 4 is not TRUE")
})
