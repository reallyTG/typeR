context("integration")

source(system.file("extdata", "defDataConv.R", package = "matconv"))
hMaps <- makeFuncMaps(
	pathDict = system.file("extdata", "HiebelerDict.txt", package = "matconv")
)
test_that("Dictionaries are loaded", {
	expect_gt(length(hMaps), 0)
	expect_gt(length(dataConvs), 0)
})

test_that("Straight conversions", {
  matCode <- "thing = isnan(reee)"
  out <- mat2r(matCode, funcConverters = hMaps, dataConverters = dataConvs)
  expect_true(!is.na(match(out$rCode, "thing <- is.na(reee)")))
})
