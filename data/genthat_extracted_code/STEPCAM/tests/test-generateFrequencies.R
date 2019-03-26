context("generateFrequencies")

test_that("generateFrequencies: use",{
  skip_on_cran()
  abund <- matrix(data = c(1, 0, 0, 1, 2, 0, 1, 1, 1), nrow = 3, byrow = TRUE)
	expected <- c(3,2,1)
	expect_equal(
		generateFrequencies(abund),
		expected
	)
})

test_that("generateFrequencies: abuse", {
  skip_on_cran()
  abund <- matrix(data = c(-1, 0, 0, 1, 2, 0, 1, 1, 1), nrow = 3, byrow = TRUE)
  expect_error(
    generateFrequencies(abund),
    "One or more entries in the abundance matrix is negative"
  )

  abund <- matrix(data = c(NA, 0, 0, 1, 2, 0, 1, 1, 1), nrow = 3, byrow = TRUE)

  expect_error(
    generateFrequencies(abund),
    "One or more entries in the abundance matrix is NA"
  )
})
