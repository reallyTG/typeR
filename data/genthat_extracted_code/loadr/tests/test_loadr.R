context("test_loadr")

test_that("eload", {
	eload(list(x=5))
	expect_equal(SV$x, 5)

	# overwrite
	eload(list(x=7))
	expect_equal(SV$x, 7)

	# doesn't change existing values
	eload(list(y=12))
	expect_equal(SV$x, 7)

	y = 15
	vload(y)
	expect_equal(SV$y, 15)
})


test_that("preserve", {
	eload(list(x=5))

	# don't overwrite
	eload(list(x=7), preserve=TRUE)
	expect_equal(SV$x, 5)
})
