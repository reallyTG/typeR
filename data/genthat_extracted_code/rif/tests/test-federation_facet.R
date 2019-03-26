context("federation_facet")

test_that("federation_facet", {
	skip_on_cran()

  tt <- federation_facet(id = "nlx_152871-2")

  expect_is(tt, "list")
  expect_match(tt$category, "Gene")
  expect_is(tt$facets, "data.frame")
  expect_is(tt$facets$count, "integer")
  expect_is(tt$facets$value, "character")
})
