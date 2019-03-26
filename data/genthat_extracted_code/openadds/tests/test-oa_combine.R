context("oa_combine")

test_that("oa_combine works", {
  skip_on_cran()

  dat <- oa_list()
	#out1 <- suppressMessages(oa_get(na.omit(dat$processed)[5]))
	#out2 <- suppressMessages(oa_get(na.omit(dat$processed)[37]))
  out1 <- suppressMessages(oa_get("http://data.openaddresses.io/runs/142783/ca/bc/langley.zip"))
  out2 <- suppressWarnings(oa_get("http://data.openaddresses.io/runs/142586/ca/on/belleville.zip"))
	aa <- suppressMessages(oa_combine(out1, out2))

	expect_is(aa, "oa")
  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")
  expect_type(aa$lon, "double")
  expect_type(aa$lat, "double")
  expect_type(aa$address, "character")
  expect_type(aa$dataset, "character")

  expect_named(aa, c('lon', 'lat', 'address', 'dataset'))

  expect_gt(NROW(aa), NROW(out1))
  expect_gt(NROW(aa), NROW(out2))
  expect_gt(NROW(out1[[1]]), NROW(out2[[1]]))
})

test_that("oa_combine fails well", {
  skip_on_cran()

  # no inputs gives an empty data.frame
  expect_equal(NROW(oa_combine()), 0)

  # bad inputs
  expect_error(oa_combine(5, 5), "all inputs must be of class 'oa'")
  expect_error(oa_combine('adf', 'adf'), "all inputs must be of class 'oa'")
})
