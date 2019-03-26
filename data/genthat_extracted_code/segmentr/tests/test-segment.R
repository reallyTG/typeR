context("segment")
require("glue")

segments <- list(1:10, 11:14, 15:28)
data <- make_segmented(segments)

test_that("consistently identify results", {
  with_algorithms(function(algorithm) {
    results <- segment(data, likelihood = function(X) mean_likelihood(X) - 1, algorithm = algorithm)
    expect_equal(results$changepoints, c(11, 15))
    expect_equal(results$segments, segments)
  })
})

test_that("shows correct representation", {
  with_algorithms(function(algorithm) {
    results <- segment(data, likelihood = function(X) mean_likelihood(X) - 1, algorithm = algorithm)
    print_value <- capture_print(results)
    expected_value <- capture_print(glue("
    Segments (total of 3):

    1:10
    11:14
    15:28
    "))
    expect_equal(print_value, expected_value)
  })
})

test_that("correctly identify when there is only one segment", {
  with_algorithms(function(algorithm) {
    data <- make_segmented(list(1:20))
    results <- segment(data, likelihood = function(X) mean_likelihood(X) - 1, algorithm = algorithm)
    expect_equal(results$segments, list(1:20))
  })
})
