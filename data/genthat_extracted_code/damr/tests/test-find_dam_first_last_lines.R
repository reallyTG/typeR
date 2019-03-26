context("dam_first_last_lines")

test_that("Start and stop dates work as expected when reading whole file with error 51 at the begining and end", {
  FILE <- damr_example("M064.txt")
  EXPECTED_FIRST_READ <- damr:::parse_datetime("2017-06-30 14:43:08", tz="UTC")
  EXPECTED_LAST_READ <- damr:::parse_datetime("2017-07-03 00:05:00", tz="UTC")

  # first read it at 2017-06-30 14:43:08, instead of 2017-06-30 14:43:00
  expect_warning(d <- damr:::find_dam_first_last_lines(FILE,
                                                        start_datetime = -Inf,
                                                        stop_datetime = +Inf,
                                                        tz="UTC"),
                 regexp = "The sampling period is not always regular")


  expect_equal(damr:::parse_datetime(d$datetime[1]), EXPECTED_FIRST_READ)
  expect_equal(damr:::parse_datetime(d$datetime[2]), EXPECTED_LAST_READ)

  EXPECTED_FIRST_READ <- damr:::parse_datetime("2017-06-30 14:44:08", tz="UTC")

  #no warning if we skip the heterogeneous read
  expect_silent(damr:::find_dam_first_last_lines( FILE,
                                                   start_datetime = EXPECTED_FIRST_READ,
                                                   stop_datetime = +Inf, tz="UTC"))

})


test_that("Start and stop dates work as expected when setting a start", {
  FILE <- damr_example("M064.txt")
  EXPECTED_FIRST_READ <- damr:::parse_datetime("2017-06-30 14:55:00", tz="UTC")

  d <- damr:::find_dam_first_last_lines(FILE, start_datetime = "2017-06-30 14:55:00", stop_datetime = +Inf, tz="UTC")

  expect_equal(damr:::parse_datetime(d$datetime[1]), EXPECTED_FIRST_READ)
})

test_that("Start and stop dates work as expected when setting a stop", {
  FILE <- damr_example("M064.txt")
  EXPECTED_FIRST_READ <- damr:::parse_datetime("2017-06-30 14:55:00", tz="UTC")
  EXPECTED_LAST_READ <- damr:::parse_datetime("2017-07-01 13:51:00", tz="UTC")

  d <- damr:::find_dam_first_last_lines(FILE, start_datetime = "2017-06-30 14:55:00",
                                         stop_datetime = "2017-07-01 13:51:00", tz="UTC")

  expect_equal(damr:::parse_datetime(d$datetime[1]), EXPECTED_FIRST_READ)
  expect_equal(damr:::parse_datetime(d$datetime[2]), EXPECTED_LAST_READ)
})

test_that("Start date is inclusive when time not specified", {
  FILE <- damr_example("M064.txt")
  EXPECTED_FIRST_READ <- damr:::parse_datetime("2017-07-01", tz="UTC")
  EXPECTED_LAST_READ <- damr:::parse_datetime("2017-07-01 23:59:00", tz="UTC")

  d <- damr:::find_dam_first_last_lines(FILE,
                                         start_datetime = "2017-07-01",
                                         stop_datetime = "2017-07-01", tz="UTC")

  expect_equal(damr:::parse_datetime(d$datetime[1]), EXPECTED_FIRST_READ)
  expect_equal(damr:::parse_datetime(d$datetime[2]), EXPECTED_LAST_READ)
})


test_that("Stop date is inclusive when time not specified", {
  FILE <- damr_example("M064.txt")
  EXPECTED_FIRST_READ <- damr:::parse_datetime("2017-06-30 14:55:00", tz="UTC")
  EXPECTED_LAST_READ <- damr:::parse_datetime("2017-07-02 00:00:00", tz="UTC")

  d <- damr:::find_dam_first_last_lines(FILE, start_datetime = "2017-06-30 14:55:00",
                                               stop_datetime = "2017-07-01", tz="UTC")

  expect_equal(damr:::parse_datetime(d$datetime[1]), EXPECTED_FIRST_READ)
})



test_that("Error when dates are inconsistent", {
  FILE <- damr_example("M064.txt")

  expect_error(damr:::find_dam_first_last_lines(FILE, "2017-07-30 14:55:00", "2017-07-01 13:51:00", tz="UTC"),
               regex="start_datetime is greater than stop_datetime")

  # data not present in the file
  expect_error(damr:::find_dam_first_last_lines(FILE, "2017-01-30 14:55:00", "2017-02-01 13:51:00", tz="UTC"),
               regex="No data")

  # data present in the end, but error 51
  expect_error(damr:::find_dam_first_last_lines(FILE, "2017-07-03 00:06:00", +Inf, tz="UTC"),
               regex="No data")

  expect_error(damr:::find_dam_first_last_lines(FILE, -Inf, "2017-06-30 14:42:00", tz="UTC"),
               regex="No data")

})


test_that("Error for daylight saving bug", {
  FILE <- damr_example("M064_DLS_bug1.txt")
  expect_error(damr:::find_dam_first_last_lines(FILE),
               regex="computer changing time")
  FILE <- damr_example("M064_DLS_bug2.txt")

  expect_error(damr:::find_dam_first_last_lines(FILE),
               regex="[Tt]ime has jumped")

  FILE <- damr_example("M064_disconnected.txt")
  expect_error(damr:::find_dam_first_last_lines(FILE),
                 regexp = "[Tt]ime has jumped")
})


test_that("ZIP wiles can be processed", {
  FILE <- damr_example("M014.txt.zip")
  EXPECTED_FIRST_READ <- damr:::parse_datetime("2017-06-30 14:55:00", tz="UTC")
  d <- damr:::find_dam_first_last_lines(FILE, start_datetime = "2017-06-30 14:55:00", stop_datetime = +Inf, tz="UTC")
  expect_equal(damr:::parse_datetime(d$datetime[1]), EXPECTED_FIRST_READ)
})


test_that("https://github.com/rethomics/damr/issues/11", {
  FILE <- damr_example("issue_11.txt.zip")
  d <- damr:::find_dam_first_last_lines(FILE,
                                         start_datetime = "2017-07-11 07:59:00",
                                         stop_datetime = +Inf, tz="UTC")
  expect_equal(d[,paste(date, time, sep= " ")], c("11 Jul 17 07:59:00", "11 Jul 17 09:27:00"))
})

