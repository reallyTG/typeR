library("veccompare")
context("Using the summarize.two.way.comparisons.percentage.overlap() function")

example_one <- summarize.two.way.comparisons.percentage.overlap(veccompare::example.vectors.list)

test_that("Summarizing two-way comparisons using the basic input is as expected", {
	expect_equal(
		example_one,
		# This is from running dput() on the command when I knew it was working as expected:
			structure(c(1, 0.6, 0.2, 0.4, 0.2, 0.25, 0.43, 1, 0.4, 0.2, 0.2,
	0.5, 0.14, 0.4, 1, 0.4, 0.6, 0.5, 0.29, 0.2, 0.4, 1, 0.4, 0,
	0.14, 0.2, 0.6, 0.4, 1, 0.5, 0.14, 0.4, 0.4, 0, 0.4, 1), .Dim = c(6L,
	6L), .Dimnames = list(c("vector_a", "vector_b", "vector_c", "vector_d",
	"vector_e", "vector_f"), c("vector_a", "vector_b", "vector_c",
	"vector_d", "vector_e", "vector_f")))
)}) # End of test


example_two <- summarize.two.way.comparisons.percentage.overlap(
	veccompare::example.vectors.list,
	output_type = "table",
	melt_table = TRUE
)

test_that("Summarizing two-way comparisons using the basic input with melted table output is as expected", {
	expect_equal(
		example_two,
		# This is from running dput() on the command when I knew it was working as expected:
		structure(list(Vector_Name = structure(c(2L, 3L, 4L, 5L, 6L,
			1L, 3L, 4L, 5L, 6L, 1L, 2L, 4L, 5L, 6L, 1L, 2L, 3L, 5L, 6L, 1L,
			2L, 3L, 4L, 6L, 1L, 2L, 3L, 4L, 5L), .Label = c("vector_a", "vector_b",
			"vector_c", "vector_d", "vector_e", "vector_f"), class = "factor"),
			    Overlaps_With = structure(c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L,
			    2L, 2L, 3L, 3L, 3L, 3L, 3L, 4L, 4L, 4L, 4L, 4L, 5L, 5L, 5L,
			    5L, 5L, 6L, 6L, 6L, 6L, 6L), .Label = c("vector_a", "vector_b",
			    "vector_c", "vector_d", "vector_e", "vector_f"), class = "factor"),
			    Decimal_Percentage = c(0.6, 0.2, 0.4, 0.2, 0.25, 0.43, 0.4,
			    0.2, 0.2, 0.5, 0.14, 0.4, 0.4, 0.6, 0.5, 0.29, 0.2, 0.4,
			    0.4, 0, 0.14, 0.2, 0.6, 0.4, 0.5, 0.14, 0.4, 0.4, 0, 0.4)), .Names = c("Vector_Name",
			"Overlaps_With", "Decimal_Percentage"), row.names = c(NA, -30L
			), class = "data.frame")
)}) # End of test


