context("Test cmr function")

test_that("Output of cmr function for single station", {

  x <- cmr(id = 18019, metadata = FALSE, cl = NULL)

  expect_that(length(x) >= 346, equals(TRUE))

  x <- cmr(id = 18019, metadata = TRUE, cl = NULL)

  expect_that(length(x) == 2, equals(TRUE))
  expect_that(x[[2]][[1]][[1]] == "Comer Burn at Comer", equals(TRUE))

  closeAllConnections()

})

test_that("Output of cmr function for multiple stations", {

  ids <- c(54022,54090,54091)

  x <- cmr(id = ids, metadata = FALSE, cl = NULL)

  expect_that(length(x) == 3, equals(TRUE))

  x <- cmr(id = ids, metadata = TRUE, cl = NULL)

  expect_that(length(x) == 3, equals(TRUE))
  expect_that(length(x[[1]]) == 2, equals(TRUE))

  y <- x[[1]]

  expect_that(all(names(y) == c("data", "meta")), equals(TRUE))

  closeAllConnections()

})

# test_that("Output of cmr function for data retrieval from multiple stations simultaneously", {
#
#   library(parallel)
#   if (detectCores() >= 2) {
#     cl <- makeCluster(getOption("cl.cores", 2))
#
#     ids <- c(54022,54090,54091)
#
#     x <- cmr(id = ids, metadata = FALSE, cl = cl)
#
#     stopCluster(cl)
#
#     expect_that(length(x) == 3, equals(TRUE))
#
#     closeAllConnections()
#
#   }else{
#     stop('Single core, cannot test simultaneous calls to server')
#   }
#
# })
