message("\nTesting get_collection_names")

test_that("Structure of collection names value", {
  skip_on_cran()
  collections <- get_collection_names()
  expect_equal(length(collections), 3)
  expect_true(length(collections$collection_names) > 50)
  expect_true(length(collections$content) > 50)
  expect_equal(class(collections$response), "response")
})

test_that("List of collections contains TCGA-BRCA", {
  skip_on_cran()
  collections <- get_collection_names()
  expect_true("TCGA-BRCA" %in% collections$collection_names)
})

test_that("List of collections contains more than 50 elements", {
  skip_on_cran()
  collections <- get_collection_names()
  expect_true(length(collections$collection_names) > 50)
})

