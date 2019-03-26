context("test_time.R")
#useful time constants
today <- Sys.Date()
tomorrow <- today + 1
yesterday <- today - 1
past_date <- as.Date('2015-06-01')
minute <- 60
hour <- minute*60
day <- hour*24
month <- day*30.5
year <- 365*day

get_seconds_helper <- function(seconds=0, minutes=0, hours=0, days=0) {
  dur <- lubridate::dseconds(seconds) +
    lubridate::dminutes(minutes) +
    lubridate::dhours(hours) +
    lubridate::ddays(days)

  lubridate::time_length(dur, unit = "second")
}

get_duration_helper <- function(seconds=0, minutes=0, hours=0, days=0) {
  dur <- lubridate::dseconds(seconds) +
    lubridate::dminutes(minutes) +
    lubridate::dhours(hours) +
    lubridate::ddays(days)

  dur
}

test_that("seconds_to_natural_delta no months works as expected", {
  test_input = c(
    day*7,
    day*31,
    day*230,
    day*400
  )
  test_output <- test_input %>%
    purrr::map_chr(seconds_to_natural_delta, use_months = FALSE)
  result_list = c(
    '7 days',
    '31 days',
    '230 days',
    '1 year, 35 days'
  )

  purrr::walk2(test_output, result_list, expect_match)
})

test_that("seconds_to_natural_delta with months works as expected", {
  test_input = c(
    0,
    1,
    30,
    get_seconds_helper(minutes = 1, seconds = 30),
    get_seconds_helper(minutes = 2),
    get_seconds_helper(hours = 1, minutes = 30, seconds = 30),
    get_seconds_helper(hours = 23, minutes = 50, seconds = 50),
    get_seconds_helper(days = 1),
    get_seconds_helper(days = 500),
    get_seconds_helper(days = 365*2 + 35),
    get_seconds_helper(seconds = 1),
    get_seconds_helper(seconds = 30),
    get_seconds_helper(minutes = 1, seconds = 30),
    get_seconds_helper(minutes = 2),
    get_seconds_helper(hours = 1, minutes = 30, seconds = 30),
    get_seconds_helper(hours = 23, minutes = 50, seconds = 50),
    get_seconds_helper(days = 1),
    get_seconds_helper(days = 500),
    get_seconds_helper(days = 365*2 + 35),
    get_seconds_helper(days = 10000),
    get_seconds_helper(days = 365 + 35),
    get_seconds_helper(days = 365*2 + 65),
    get_seconds_helper(days = 365 + 4),
    get_seconds_helper(days = 35),
    get_seconds_helper(days = 65),
    get_seconds_helper(days = 9),
    get_seconds_helper(days = 365)
  )
  test_output <- test_input %>%
    purrr::map_chr(seconds_to_natural_delta)
  result_list = c(
    'now',
    'a second',
    '30 seconds',
    'a minute',
    '2 minutes',
    'an hour',
    '23 hours',
    'a day',
    '1 year, 4 months',
    '2 years',
    'a second',
    '30 seconds',
    'a minute',
    '2 minutes',
    'an hour',
    '23 hours',
    'a day',
    '1 year, 4 months',
    '2 years',
    '27 years',
    '1 year, 1 month',
    '2 years',
    '1 year, 4 days',
    'a month',
    '2 months',
    '9 days',
    'a year'
  )
  purrr::walk2(test_output, result_list, expect_match)
})


test_that("natural_time works as expected", {
  right_now <- lubridate::now()
  # need to use list here so we can mix ints and times
  test_list <- list(
    right_now,
    right_now - get_duration_helper(seconds = 1),
    right_now - get_duration_helper(seconds = 30),
    right_now - get_duration_helper(minutes = 1, seconds = 30),
    right_now - get_duration_helper(minutes = 2),
    right_now - get_duration_helper(hours = 1, minutes = 30, seconds = 30),
    right_now - get_duration_helper(hours = 23, minutes = 50, seconds = 50),
    right_now - get_duration_helper(days = 1),
    right_now - get_duration_helper(days = 500),
    right_now - get_duration_helper(days = 365*2 + 35),
    right_now + get_duration_helper(seconds = 1),
    right_now + get_duration_helper(seconds = 30),
    right_now + get_duration_helper(minutes = 1, seconds = 30),
    right_now + get_duration_helper(minutes = 2),
    right_now + get_duration_helper(hours = 1, minutes = 30, seconds = 30),
    right_now + get_duration_helper(hours = 23, minutes = 50, seconds = 50),
    right_now + get_duration_helper(days = 1),
    right_now + get_duration_helper(days = 500),
    right_now + get_duration_helper(days = 365*2 + 35),
    right_now + get_duration_helper(days = 10000),
    right_now - get_duration_helper(days = 365 + 35),
    30,
    right_now - get_duration_helper(days = 365*2 + 65),
    right_now - get_duration_helper(days = 365 + 4)
  )
  # need to fix the current  time
  with_mock(
    now  = function(x) {right_now},
    test_output <- test_list %>%
      purrr::map_chr(natural_time),
    .env = "lubridate"
  )

  result_list <- c(
    'now',
    'a second ago',
    '30 seconds ago',
    'a minute ago',
    '2 minutes ago',
    'an hour ago',
    '23 hours ago',
    'a day ago',
    '1 year, 4 months ago',
    '2 years ago',
    'a second from now',
    '30 seconds from now',
    'a minute from now',
    '2 minutes from now',
    'an hour from now',
    '23 hours from now',
    'a day from now',
    '1 year, 4 months from now',
    '2 years from now',
    '27 years from now',
    '1 year, 1 month ago',
    '30 seconds ago',
    '2 years ago',
    '1 year, 4 days ago'
  )
  purrr::walk2(test_output, result_list, expect_match)
})

test_that("natural_time no months works as expected", {
  right_now <- lubridate::now()
  # need to use list here so we can mix ints and times
  test_list = list(
    right_now,
    right_now - get_duration_helper(seconds = 1),
    right_now - get_duration_helper(seconds = 30),
    right_now - get_duration_helper(minutes = 1, seconds = 30),
    right_now - get_duration_helper(minutes = 2),
    right_now - get_duration_helper(hours = 1, minutes = 30, seconds = 30),
    right_now - get_duration_helper(hours = 23, minutes = 50, seconds = 50),
    right_now - get_duration_helper(days = 1),
    right_now - get_duration_helper(days = 17),
    right_now - get_duration_helper(days = 47),
    right_now - get_duration_helper(days = 500),
    right_now - get_duration_helper(days = 365*2 + 35),
    right_now + get_duration_helper(seconds = 1),
    right_now + get_duration_helper(seconds = 30),
    right_now + get_duration_helper(minutes = 1, seconds = 30),
    right_now + get_duration_helper(minutes = 2),
    right_now + get_duration_helper(hours = 1, minutes = 30, seconds = 30),
    right_now + get_duration_helper(hours = 23, minutes = 50, seconds = 50),
    right_now + get_duration_helper(days = 1),
    right_now + get_duration_helper(days = 500),
    right_now + get_duration_helper(days = 365*2 + 35),
    right_now + get_duration_helper(days = 10000),
    right_now - get_duration_helper(days = 365 + 35),
    30,
    right_now - get_duration_helper(days = 365*2 + 65),
    right_now - get_duration_helper(days = 365 + 4)
  )

  # need to fix the current  time
  with_mock(
    now  = function(x) {right_now},
    test_output <- test_list %>%
      purrr::map_chr(natural_time, use_months = FALSE),
    .env = "lubridate"
  )

  result_list = c(
    'now',
    'a second ago',
    '30 seconds ago',
    'a minute ago',
    '2 minutes ago',
    'an hour ago',
    '23 hours ago',
    'a day ago',
    '17 days ago',
    '47 days ago',
    '1 year, 135 days ago',
    '2 years ago',
    'a second from now',
    '30 seconds from now',
    'a minute from now',
    '2 minutes from now',
    'an hour from now',
    '23 hours from now',
    'a day from now',
    '1 year, 135 days from now',
    '2 years from now',
    '27 years from now',
    '1 year, 35 days ago',
    '30 seconds ago',
    '2 years ago',
    '1 year, 4 days ago'
  )
  purrr::walk2(test_output, result_list, expect_match)
})


test_that("natural_day works as expected", {


  expect_match(natural_day(today), 'today')
  expect_match(natural_day(tomorrow), 'tomorrow')
  expect_match(natural_day(yesterday), 'yesterday')
  expect_match(natural_day(past_date), "Jun 01")
  # TODO Error tests

})


test_that("natural_date works as expected", {
  past_date <- as.Date('2015-06-01')

  expect_match(natural_date(today), 'today')
  expect_match(natural_date(tomorrow), 'tomorrow')
  expect_match(natural_date(yesterday), 'yesterday')
  expect_match(natural_date(past_date), "Jun 01 2015")
  # TODO Error tests

})
