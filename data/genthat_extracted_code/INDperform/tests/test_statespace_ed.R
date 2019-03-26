context("test statespace_ed")

dat1 <- statespace_ed(x = ind_ex[, c(2, 3, 4, 8, 10,
  11)], time = ind_ex$Year)
default_ref_time <- dat1$time[dat1$ed == 0]
dat2 <- statespace_ed(x = ind_ex[, c(2, 3, 4, 8, 10,
  11)], time = ind_ex$Year, ref_time = 1990)

test_that("test 'ref_time' variable in output dfr",
  {
    expect_error(statespace_ed(x = ind_ex[, c(2,
      3, 4, 8, 10, 11)], time = ind_ex$Year,
      ref_time = 1960))

    expect_equal(default_ref_time, dat1$time[1])
    expect_true(dat1$ref_time[dat1$ed == 0])
    expect_equal(sum(dat1$ref_time), 1)

    expect_true(dat2$ref_time[dat2$ed == 0])
    expect_equal(sum(dat2$ref_time), 1)

    expect_true(is.logical(dat2$ref_time))
  })


test_that("test 'ed' variable in output dfr", {
  expect_equal(sum(dat1$ed == 0), 1)
  expect_equal(sum(dat2$ed == 0), 1)
  expect_equal(sum(dat1$ed < 0), 0)
  expect_equal(sum(dat2$ed < 0), 0)

  expect_is(dat2$ed, "numeric")
})


# Test data input validation
test_that("test error messages", {
  # missing arguments
  expect_error(statespace_ed(ind_ex), "Argument time is missing")
  expect_error(statespace_ed(time = ind_ex$Year),
    "Argument x is missing")

  expect_error(statespace_ed(x = as.list(ind_ex),
    time = ind_ex$Year), "x cannot be a list")
  expect_error(statespace_ed(x = ind_ex[, -1], time = as.character(ind_ex$Year)),
    "time has to be an INTEGER vector")
  expect_error(statespace_ed(x = ind_ex[, -1], time = as.data.frame(ind_ex$Year)),
    "time has to be a VECTOR")
  expect_error(statespace_ed(x = ind_ex[, c(2, 3,
    4, 8, 10, 11)], time = ind_ex$Year, ref_time = "1975"),
    "The defined reference time is")
})
