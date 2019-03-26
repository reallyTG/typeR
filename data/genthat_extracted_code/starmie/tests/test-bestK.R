# test-bestK.R
context("checks for bestK")
# load sample dataset
multi_K <- exampleStructure("multiple_runs")
# single runs
single_runs <- multi_K[1:10]
# non-sequential K
Ks <- unlist(lapply(multi_K, getK))
uneven_Ks <- multi_K[Ks %in% c('9', '4', '2')]

test_that("sanity checks for structList", {
  # can't pass single struct object to test_that
  expect_error(bestK(multi_K[[1]]))
  expect_error(bestK(multi_K, method=NA), "method must be one of 'evanno' or 'structure'")
  expect_error(bestK(multi_K, plot="yes"), "plot must be one of TRUE or FALSE")
  # evanno method doesn't work if only single runs
  expect_error(bestK(single_runs, make_plot = FALSE))
  # structure method does output but for sd should be all NA in results
  expect_true(all(is.na(bestK(single_runs, method = "structure", plot = FALSE)$sd)))
  expect_warning(bestK(uneven_Ks, plot = FALSE))
})
