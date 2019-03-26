library("veccompare")
context("Vector printing")

test_that("Vector printing is correctly formatted with non-empty strings", {
	expect_equal(
		vector.print.with.and(c("One", "Two", "Three", "Four")),
		"One, Two, Three, and Four"
	)
	expect_equal(
		vector.print.with.and(c("One", "Two", "Three", "Four"), use_oxford_comma = FALSE),
		"One, Two, Three and Four"
	)

	expect_equal(
		vector.print.with.and(c("One", "Two")),
		"One and Two"
	)

	expect_equal(
		vector.print.with.and(c("One")),
		"One"
	)
	expect_equal(
		vector.print.with.and("One"),
		"One"
	)
})

test_that("Vector printing is correctly formatted with empty strings", {
	expect_equal(
		vector.print.with.and(c(), string_to_return_if_vector_is_empty = "(None)"),
		"(None)"
	)
	expect_equal(
		vector.print.with.and(c(""), string_to_return_if_vector_is_empty = "(None)"),
		""
	)
	expect_equal(
		vector.print.with.and(c("")),
		""
	)
	expect_equal(
		vector.print.with.and(NULL),
		""
	)
	expect_equal(
		vector.print.with.and(NA),
		NA
	)
})
