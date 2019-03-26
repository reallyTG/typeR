# context("uuid-check for testdata")
# test_that("uuid of testdata didn't change", {
#   # skip("Skip for development of tests")
#
#   expect_equal(data$uuid, "ba6b7622-452d-11e6-8bc9-c94b5972ecfb")
#   expect_equal(class(data$uuid), "character")
# })

context("basic functions")
test_that("sim_datetime works", {
  # skip("Skip for development of tests")
  expect_equal(as.sim_datetime(t_20160101, origin_date), 0)
  expect_equal(as.sim_datetime(t_20160102, origin_date), 86400)
  expect_equal(as.sim_datetime(t_20170101, origin_date), 366*24*60*60)
})

test_that("datetime works", {
  # skip("Skip for development of tests")

  expect_equal(as.datetime(as.sim_datetime(t_20160101, origin_date), origin_date), t_20160101)
  expect_equal(as.datetime(as.sim_datetime(t_20160102, origin_date), origin_date), t_20160102)
  expect_equal(as.datetime(as.sim_datetime(t_20170101, origin_date), origin_date), t_20170101)
})

test_that("sim_date works", {
  # skip("Skip for development of tests")

  expect_equal(sim_date(0), 0)
  expect_equal(sim_date(24*3600), 1)
  expect_equal(sim_date(365*24*3600), 365)
})

test_that("sim_time delivers the right number of seconds of the day", {
  # skip("Skip for development of tests")

  expect_equal(sim_time(0), 0)
  expect_equal(sim_time(24*60*60), 0)
  expect_equal(sim_time(365*24*60*60), 0)
  expect_equal(sim_time(365*24*60*60 - 1), 24*60*60 - 1)
})

test_that("sim_wday works", {
  # skip("Skip for development of tests")

  expect_equal(sim_wday(0, origin_date), format(origin_date, "%u"))
  expect_equal(sim_wday(24*60*60 - 1, origin_date), format(origin_date + 24*60*60 - 1, "%u"))
  expect_equal(sim_wday(24*60*60, origin_date), format(origin_date + 24*60*60, "%u"))
  expect_equal(sim_wday(6*24*60*60, origin_date), format(origin_date + 6*24*60*60, "%u"))
  expect_equal(sim_wday(365*24*60*60, origin_date), format(origin_date + 365*24*60*60, "%u"))
})

