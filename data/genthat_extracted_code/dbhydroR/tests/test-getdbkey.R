context("get_dbkey")

test_that("get_dbkey fails well", {
  skip_on_cran()

  expect_error(get_dbkey(stationid = "S152%", category = "GW"),
    "No dbkeys found")

})

test_that("get_dbkey works", {
  skip_on_cran()

  res <- invisible(get_dbkey(stationid = "C111AE", category = "GW",
         param = "WELL", freq = "DA", stat = "MEAN", strata = c(9, 22),
         recorder = "TROL", agency = "WMD", detail.level = "full"))
  expect_is(invisible(res), "data.frame")
  expect_equal(nrow(res), 1)

  res <- get_dbkey(stationid = c("MBTS", "JBTS"), category = "WEATHER",
         param = "WNDS", freq = "DA", detail.level = "dbkey")
  expect_equal(length(res), 2)

})

