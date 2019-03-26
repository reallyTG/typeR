context("listStabilityMeasures")

test_that("list", {
  checkmate::expect_data_frame(listStabilityMeasures(),
    ncols = 5, min.rows = 17, types = c("character", "numeric", "logical"), null.ok = FALSE,
    col.names = "named")
})

test_that("measures exist", {
  l = listStabilityMeasures()
  lapply(l$Name, function(x) {
    checkmate::expect_function(get(x), null.ok = FALSE, info = x)
  })
})