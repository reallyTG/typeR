context("get_ts")

test_that("get_ts cmr single works", {

  rain <- rnrfa:::get_ts(id = 18019, type = "cmr")
  expect_true(length(rain) >= 660)

})

test_that("get_ts cmr multi works", {

  rain <- rnrfa:::get_ts(id = c(54022, 54090, 54091), type = "cmr")
  expect_true(length(rain[[1]]) >= 756)
  expect_true(length(rain[[2]]) >= 660)
  expect_true(length(rain[[3]]) >= 660)

})

test_that("get_ts gdf single works", {

  flow <- rnrfa:::get_ts(id = 18019, type = "gdf")
  expect_equal(as.numeric(flow[1]), 0.056)
  expect_true(length(flow) >= 731)

})

test_that("get_ts gdf multi works", {

  flow <- rnrfa:::get_ts(id = c(54022, 54090, 54091), type = "gdf")
  expect_equal(as.numeric(flow[[1]][1]), 0.637)
  expect_true(length(flow[[1]]) >= 16855)
  expect_equal(as.numeric(flow[[2]][1]), 0.031)
  expect_true(length(flow[[2]]) >= 13159)
  expect_equal(as.numeric(flow[[3]][1]), 1.262)
  expect_true(length(flow[[3]]) >= 12416)

})
