context("pl_places")

test_that("pl_places works", {
  skip_on_cran()

  aa <- pl_places(place_id = 462471)

	expect_is(aa, 'pleiades')
	expect_is(unclass(aa), 'list')
	expect_named(aa$features[[1]], c('geometry', 'type', 'id', 'properties'))
	expect_equal(aa$id, "462471")
})
