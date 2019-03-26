context("render")

test_that("Can render geo assets", {
  skip_if_not_installed("htmltools")

  rendered <- htmltools::renderDependencies(list(geo_assets()), "file")
  expect_equal(
    rendered,
    htmltools::HTML('<script src="lib/plotly-geo-assets.js"></script>')
  )
})
