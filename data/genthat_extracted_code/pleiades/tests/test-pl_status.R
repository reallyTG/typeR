context("pl_status")

test_that("pl_status works", {
  skip_on_cran()

  aa <- pl_status()

	expect_is(aa, 'list')
	expect_named(aa, c('num_places', 'num_locations', 'num_names'))
})
