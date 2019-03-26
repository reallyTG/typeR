context("Test gdf function")

test_that("Output of gdf function for id 18019", {

  expect_that(dim(gdf(18019))[1] >= 729, equals(TRUE))

  closeAllConnections()

})
