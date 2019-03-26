context("oa_search")

test_that("oa_search works", {
  skip_on_cran()

  # search by various combinations
  ## country
  aa <- oa_search(country = "us")
  ## country and state
  bb <- oa_search(country = "us", state = "ca")
  ## state
  cc <- oa_search(state = "tx")
  ## city
  dd <- oa_search(city = "houston")

  expect_is(aa, "data.frame")
  expect_is(bb, "data.frame")
  expect_is(cc, "data.frame")
  expect_is(dd, "data.frame")

  expect_is(aa, "tbl_df")
  expect_is(bb, "tbl_df")
  expect_is(cc, "tbl_df")
  expect_is(dd, "tbl_df")

  expect_named(aa, c('country', 'state', 'city', 'id', 'url'))

  expect_gt(NROW(aa), NROW(bb))

  expect_equal(length(unique(aa$country)), 1)
  expect_equal(unique(aa$country), "us")

  expect_equal(length(unique(bb$state)), 1)
  expect_equal(unique(bb$state), "ca")

  expect_equal(length(unique(cc$state)), 1)
  expect_equal(unique(cc$state), "tx")

  expect_equal(length(dd$city), 2)
  expect_equal(unique(dd$city), "houston")
})

test_that("oa_search fails well", {
  skip_on_cran()

  expect_equal(NROW(oa_search(country = "fadadfd")), 0)
})
