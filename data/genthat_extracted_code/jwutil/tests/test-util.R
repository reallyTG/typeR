context("Utility Functions")

test_that("inverse of base 'which' function", {
  expect_error(invwhich(bad_input))
  expect_error(invwhich(random_test_letters))
  expect_error(invwhich())
  expect_error(invwhich(0))
  expect_error(invwhich(-1))
  expect_error(invwhich(1.5))
  expect_error(invwhich(1, len = "carrots"))
  expect_error(invwhich(1, len = -1))
  expect_error(invwhich(1, len = 0.5))
  expect_error(invwhich(1, len = c(1, 2)))

  expect_equal(invwhich(1), TRUE)
  expect_equal(invwhich(2), c(FALSE, TRUE))
  expect_equal(invwhich(c(1, 2)), c(TRUE, TRUE))
  expect_equal(invwhich(c(1, 2), len = 3), c(TRUE, TRUE, FALSE))
})

test_that("as_char_no_warn", {
  expect_error(as_char_no_warn())
  expect_equal(as_char_no_warn(1), "1")
  expect_equal(as_char_no_warn(1L), "1")
  expect_equal(as_char_no_warn(1.1), "1.1")
  expect_equal(as_char_no_warn(c(1.2, 34.555)), c("1.2", "34.555"))

  expect_equal(as_char_no_warn(NA), NA_character_)
  expect_equal(as_char_no_warn(c(1.2, NA)), c("1.2", NA_character_))
  expect_equal(as_char_no_warn(c(NA, 1.2)), c(NA_character_, "1.2"))
})

test_that("as_char_no_warn factor", {
  expect_equal(as_char_no_warn(factor(1)), "1")
  expect_equal(as_char_no_warn(factor(1L)), "1")
  expect_equal(as_char_no_warn(factor(1.1)), "1.1")
  expect_equal(as_char_no_warn(factor(c(1.2, 34.555))), c("1.2", "34.555"))

  expect_equal(as_char_no_warn(factor(NA)), NA_character_)
  expect_equal(as_char_no_warn(factor(c(1.2, NA))), c("1.2", NA_character_))
  expect_equal(as_char_no_warn(factor(c(NA, 1.2))), c(NA_character_, "1.2"))
  expect_equal(as_char_no_warn(factor(NA, exclude = FALSE)), NA_character_)
  expect_equal(as_char_no_warn(factor(c(1.2, NA), exclude = FALSE)),
               c("1.2", NA_character_))
  expect_equal(as_char_no_warn(factor(c(NA, 1.2), exclude = FALSE)),
               c(NA_character_, "1.2"))
})


test_that("asNumericNoWarn", {
  expect_error(asNumericNoWarn())

  expect_true(is.na(asNumericNoWarn(NA)))
  expect_equal(asNumericNoWarn("1"), 1.0)
  expect_equal(asNumericNoWarn("1.1"), 1.1)
  expect_equal(asNumericNoWarn("-1"), -1.0)
  expect_equal(asNumericNoWarn(c("-1 ", " not a number", "100")),
               c( -1.0, NA_real_, 100.0))

})

test_that("asNumericNoWarn factor", {
  expect_true(is.na(asNumericNoWarn(factor(NA))))
  expect_true(is.na(asNumericNoWarn(factor(NA, exclude = NULL))))
  expect_equal(asNumericNoWarn(factor("1")), 1.0)
  expect_equal(asNumericNoWarn(factor("1.1")), 1.1)
  expect_equal(asNumericNoWarn(factor("-1")), -1.0)
  expect_equal(asNumericNoWarn(factor(c("-1 ", " not a number", "100"))),
               c( -1.0, NA_real_, 100.0))

})

test_that("asIntegerNoWarn", {
  expect_error(asIntegerNoWarn())

  expect_equal(asIntegerNoWarn(NA), NA_integer_)
  expect_equal(asIntegerNoWarn("1"), 1L)
  expect_equal(asIntegerNoWarn("1.1"), 1L)
  expect_equal(asIntegerNoWarn("-1"), -1L)
  expect_equal(asIntegerNoWarn(c("-1.1 ", " not a number", "100")),
               c( -1L, NA_integer_, 100L))
})

test_that("asIntegerNoWarn factor", {
  expect_equal(asIntegerNoWarn(factor(NA, exclude = TRUE)), NA_integer_)
  expect_equal(asIntegerNoWarn(factor(NA, exclude = FALSE)), NA_integer_)
  expect_equal(asIntegerNoWarn(factor("1")), 1L)
  expect_equal(asIntegerNoWarn(factor("1.1")), 1L)
  expect_equal(asIntegerNoWarn(factor("-1")), -1L)
  expect_equal(asIntegerNoWarn(factor(c("-1.1 ", " not a number", "100"))),
               c( -1L, NA_integer_, 100L))
})

test_that("countNotNumeric", {
  expect_error(countNotNumeric())
  expect_equal(countNotNumeric(c(NA)), 1)
  expect_equal(countNotNumeric(c("badger's mount")), 1)
  expect_equal(countNotNumeric(c("1 ", NA)), 1)
  expect_equal(countNotNumeric(c(" 1", NA)), 1)
  expect_equal(countNotNumeric(c(" 1 ", NA)), 1)
  expect_equal(countNotNumeric(c("1", "two", NA)), 2)
  expect_equal(countNotNumeric(c("1", "two", c(NA, 1))), 2)
  expect_equal(countNotNumeric(c("1", "two", c("2", NA, 1))), 2)
  # no non-numeric values in an empty vector? NULL?
  expect_equal(countNotNumeric(c()), 0)
})

test_that("countNumeric", {
  expect_error(countNumeric())
  expect_equal(countNumeric(c(NA)), 0)
  expect_equal(countNumeric(c("badger's mount")), 0)
  expect_equal(countNumeric(c("1 ", NA)), 1)
  expect_equal(countNumeric(c(" 1", NA)), 1)
  expect_equal(countNumeric(c(" 1 ", NA)), 1)
  expect_equal(countNumeric(c("1", "two", NA)), 1)
  expect_equal(countNumeric(c("1", "two", "2")), 2)
  expect_equal(countNumeric(c("9.9 ", NA)), 1)
  expect_equal(countNumeric(c(" 9.9", NA)), 1)
  expect_equal(countNumeric(c(" 9.9 ", NA)), 1)
  expect_equal(countNumeric(c("9.9", "two", NA)), 1)
  expect_equal(countNumeric(c("9.9", "two", NA, 1)), 2)
  # no non-numeric values in an empty vector?
  expect_equal(countNumeric(c()), 0)
})

test_that("propIsNa", {
  expect_equal(propIsNa(c()), 0)   # don't divide by zero
  expect_equal(propIsNa(c(1)), 0)
  expect_equal(propIsNa(c(NA)), 1)
  expect_equal(propIsNa(c(NA, NA)), 1)
  expect_equal(propIsNa(c(1, NA)), 0.5)
  expect_equal(propIsNa(c(NA, 1)), 0.5)
  expect_equal(propIsNa(c(NA, "two", 1, NA)), 0.5)
})

dbinary <- data.frame(jack = c("21232", 421412, 123123),
                      hayley = c(1, 0, 0), ham = c(0, 1, 0))
dlogical <- data.frame(jack = c("21232", 421412, 123123),
                       hayley = c(T, F, F), ham = c(F, T, F))

test_that("logicalToBinary", {


  expect_error(logicalToBinary())
  expect_error(logicalToBinary(FALSE))
  expect_error(logicalToBinary(list(dbinary, "rubbish")))
  expect_error(logicalToBinary(data.frame()))

  result <- logicalToBinary(dbinary)
  expect_identical(result, dbinary)   # no logicals!

  rlogical <- logicalToBinary(dlogical)
  expect_equivalent(rlogical, dbinary)

})

not_dates_or_times <- flattenList(extreme_numbers,
                                  random_test_letters(),
                                  random_test_numbers(hole = c(0, 2400)))

# overall stategy: anything invalid gives error. Consider giving warnings for
# syntactically correct but invalid inputs, e.g. time "2505" but error for
# "55555"

valid_dates <- list(
  "1899-12-31",
  "1900-01-01",
  "1900-1-1",
  "2012-6-06",
  "2013-06-6",
  "2015-10-10")

invalid_short_dates <- list(
  # can't allow 2 digit years, even if as.Date could convert them, because
  # high chance of ambiguity, e.g. with birth dates at the begniing of either
  # century.
  "14-12-31",
  "200-12-31",
  "20141231",
  "2014-31-12",
  "1849-12-01")

invalid_long_dates <- list(
  "2005-12-31 23:59",
  #    "2005-12-31 24:00",  # 24:00 is technically valid POSIX. I don't want
  #    to test all of R date functions here, but I'm sure MV throws out some
  #    stupid numbers "2005-02-20 24:00",  #
  "2005-02-31 12:00",  # 31st feb
  "2005-01-01 24:01",
  "2005-12-31 00:01",
  "2005-12-31 00:00:01")

invalid_dates <- flattenList(invalid_short_dates, invalid_long_dates)

#TODO: include nonsense numbers and strings in the bad dates and times,
#randomly generated TODO: include empty strings and NULLs

numbertimes <- numbers_to_long_and_float(2359, 959, 10, 1, 0, na.rm = TRUE)
stringtimes <- list("2359", "959", "0", "1")  # no leading zeros
paddedtimes <- list("0959", "100", "0000", "0001")
numbertimesbad <- flattenList(
  -0.1, 0.7, 100.6,
  numbers_to_long_and_float(2400, 2401, 999, -1, 2500,
                            -1.1, 12345, 100000000000000)
  # technically 2400 is ISO POSIX valid, but I want an error in this case
)
stringtimesbad <- c("2401", "999", "0999", "9999", "-1",
                    "100.5", "2500", "-0.1", "1-1")
valid_times <- flattenList(numbertimes, stringtimes, paddedtimes)
invalid_times <- flattenList(numbertimesbad, stringtimesbad,
                             not_dates_or_times, valid_dates,
                             invalid_long_dates, invalid_short_dates)
#"invalid times: %s", paste(invalid_times, collapse = " "

# nested tests, now the harness has been set up...
test_that("completely stupid inputs, e.g. giving (valid) dates as time field", {

  # use valid input, but in the wrong place
  for (jd in valid_dates) {
    for (jt in valid_times) {
      # if Date class is put in time field, then this is a programming error,
      # not a data error, so stop.
      expect_error(
        add_time_to_date(tms = as.Date(jd), dts = jd),
        label = "incorrectly put date in time column",
        info = paste(jd, sep = " ", collapse = ", "))

      expect_error(
        add_time_to_date(dts = c(jd, jd), tms = c(jt, jt, jt)),
        info = paste(jd, jt, sep = " ", collapse = ", "))  # lengths differ

      expect_error(
        add_time_to_date(dts = c(jd, jd), tms = jt),
        info = paste(jd, jt, sep = " ", collapse = ", "))  #  lengths differ
    }
  }
})

expect_true(is.na(add_time_to_date(NA, NA)))

# numeric class should error for Date
expect_error(add_time_to_date(dts = 7.7, tms = "2020"))
# numeric class should error for Date
expect_error(add_time_to_date(dts = 20141231, tms = "2020"))

test_that("bad dates, give errors, regardless of time input", {
  for (jd in invalid_dates) {
    for (jt in flattenList(valid_times, invalid_times)) {
      expect_that(
        add_time_to_date(dts = jd, tms = jt),
        throws_error(),
        info = sprintf("class(jd)=%s, class(jt)=%s, jd=%s, jt=%s",
                       class(jd), class(jt), jd, jt)
      )
    }
  }
})

test_that("bad times give warnings, with good date input", {
  for (jd in flattenList(valid_dates)) {
    for (jt in invalid_times) {

      expect_that(
        add_time_to_date(dts = jd, tms = jt),
        testthat::not(testthat::throws_error()),
        info = sprintf("class(jd)=%s, class(jt)=%s, jd=%s, jt=%s",
                       class(jd), class(jt), jd, jt)
      )

      expect_that(
        add_time_to_date(dts = jd, tms = jt),
        testthat::gives_warning(),
        info = sprintf("class(jd)=%s, class(jt)=%s, jd=%s, jt=%s",
                       class(jd), class(jt), jd, jt)
      )

    }
  }
})

#can't give datetime for as date: we're expecting just a date
expect_error(add_time_to_date(fulldates,
                              rep(x = "1230", times = length(fulldates))))

test_that("good inputs don't give errors or warnings, including NA", {
  for (jd in c(valid_dates, NA)) {
    for (jt in c(valid_times, NA)) {
      add_time_to_date(
        dts = jd,
        tms = jt
      )

      expect_error(
        add_time_to_date(dts = jd, tms = jt),
        regex = NA,
        info = paste("classes: ", class(jd), class(jt),
                     " data: ", jd, jt, collapse = ", ", sep = ", "))

      expect_warning(
        add_time_to_date(dts = jd, tms = jt),
        regex = NA,
        info = paste("classes: ", class(jd), class(jt),
                     " data: ", jd, jt, collapse = ", ", sep = ", "))

      expect_that(
        add_time_to_date(dts = jd, tms = jt),
        is_a("POSIXlt"),
        info = paste("classes: ", class(jd), class(jt),
                     " data: ", jd, jt, collapse = ", ", sep = ", "))
    }
  }
})
# TODO: ?error if one value is NA and the other is invalid?

test_that("Count cumulative non-NA values in times", {
  expect_equivalent(
    countNonNaCumulative(data.frame(fa = c(1, 2, 3),
                                    fb = c(NA, NA, NA),
                                    fc = c(99, 99, NA))
    ),
    setNames(c(3, 3, 3), c("fa", "fb", "fc")))

  expect_equivalent(
    countNonNaCumulative(data.frame(fa = c(1, NA, 3),
                                    fb = c(NA, NA, NA),
                                    fc = c(99, 99, NA))
    ),
    setNames(c(2, 2, 3), c("fa", "fb", "fc")))

  expect_equivalent(
    countNonNaCumulative(data.frame(fa = c(NA, 2, 3),
                                    fb = c(NA, NA, NA),
                                    fc = c(99, 99, NA))
    ),
    setNames(c(2, 2, 3), c("fa", "fb", "fc")))

  expect_equivalent(
    countNonNaCumulative(data.frame(fa = c(NA, NA, NA),
                                    fb = c(NA, NA, NA),
                                    fc = c(NA, NA, NA))
    ),
    setNames(c(0, 0, 0), c("fa", "fb", "fc")))

  expect_equivalent(
    countNonNaCumulative(data.frame(fa = c(1:3),
                                    fb = c(5:7),
                                    fc = c(9:11))
    ),
    setNames(c(3, 3, 3), c("fa", "fb", "fc")))

})

test_that("allIsNumeric", {
  expect_true(allIsNumeric(1))
  expect_true(allIsNumeric(c(1, 2)))
  expect_true(allIsNumeric(1.1))
  expect_true(allIsNumeric(-1))
  expect_true(allIsNumeric(pi))
  expect_true(allIsNumeric(c(-1, 0, 0.1, pi)))
  expect_true(allIsNumeric(zeroes))
  expect_true(allIsNumeric(random_test_numbers()))
  expect_true(allIsNumeric(extreme_numbers))
  expect_true(allIsNumeric(NA_integer_))
  expect_true(allIsNumeric(NA_real_))
  expect_true(allIsNumeric(random_test_dates()))  # dates are typeof 'double'
  expect_false(allIsNumeric(random_test_letters()))
  expect_error(allIsNumeric(bad_input))
})

test_that("allIsInteger", {
  expect_false(allIsInteger(NULL))
  expect_true(allIsInteger(1))
  expect_true(allIsInteger(integer(0)))
  expect_true(allIsInteger(c(1, 2)))
  expect_true(allIsInteger(-1))
  expect_true(allIsInteger(zeroes))
  expect_true(allIsInteger(random_test_integers()))
  expect_true(allIsInteger(NA_integer_, na.rm = T))
  expect_true(allIsInteger(NA_real_, na.rm = T))
  expect_true(allIsInteger(NA_integer_))
  expect_true(allIsInteger(NA_real_))
  expect_true(allIsInteger(1.00000000005))
  expect_true(allIsInteger(1.005, tol = 0.01))
  expect_true(allIsInteger(c(1.005, NA_integer_), tol = 0.01, na.rm = T))
  # I don't care what sort of NA is given:
  expect_true(allIsInteger(c(1.005, NA_character_), tol = 0.01, na.rm = T))

  expect_false(allIsInteger(random_test_numbers()))
  expect_false(allIsInteger(pi))
  expect_false(allIsInteger(1.000000002))
  expect_false(allIsInteger(-0.1))
  expect_false(allIsInteger("jack"))
  expect_false(allIsInteger(random_test_letters()))
  expect_false(allIsInteger(c(-1, 0, 0.1, pi)))

  expect_error(allIsInteger(bad_input))
})

test_that("areIntegers", {
  expect_false(areIntegers(NULL))
  expect_true(areIntegers(1))
  expect_identical(areIntegers(integer(0)), logical(0))
  expect_that(areIntegers(c(1, 2)), testthat::equals(c(TRUE, TRUE)))
  expect_true(areIntegers(-1))
  expect_true(all(areIntegers(zeroes)))
  expect_true(all(areIntegers(random_test_integers())))
  expect_true(areIntegers(1.00000000005))  # inside default tolerance
  expect_that(areIntegers(NA_integer_, na.ignore = T),
              testthat::equals(NA_integer_))
  expect_that(areIntegers(NA_real_, na.ignore = T),
              testthat::equals(NA_integer_))
  expect_that(areIntegers(NA_character_, na.ignore = T),
              testthat::equals(NA_integer_))
  expect_false(areIntegers(NA_integer_, na.ignore = F))
  expect_false(areIntegers(NA_real_, na.ignore = F))
  expect_false(areIntegers(NA_character_, na.ignore = F))
  expect_true(areIntegers(1.005, tol = 0.01))
  # multi value:
  expect_equal(areIntegers(c(1, 0, -1)), c(T, T, T))
  expect_equal(areIntegers(zeroes), rep(TRUE, times = length(zeroes)))
  expect_equal(areIntegers(random_test_integers()),
               rep(TRUE, times = length(random_test_integers())))
  expect_that(
    areIntegers(c(1 + 1e-10, 1.1, 1 - 1e-10)),
    testthat::equals(c(TRUE, FALSE, TRUE)))  # both inside default tolerance
  expect_that(
    areIntegers(c(-0.1, 0.02, 0.3, 4.4, 55.6789, pi, sqrt(2))),
    testthat::equals(c(F, F, F, F, F, F, F)))  # both inside default tolerance
  expect_that_combine_first_arg(
    areIntegers(c(NA_integer_, NA_real_, NA_character_), na.ignore = T),
    testthat::equals(c(NA_integer_, NA_integer_, NA_integer_)))
  expect_that(
    areIntegers(c(NA_integer_, 1.1, 2.0), na.ignore = F),
    testthat::equals(c(FALSE, FALSE, TRUE)))
  expect_that(
    areIntegers(c(NA_integer_, 1.1, 2.0), na.ignore = T),
    testthat::equals(c(NA_integer_, FALSE, TRUE)))
  expect_that(
    areIntegers(c(NA_integer_, NA_real_, NA_character_), na.ignore = F),
    testthat::equals(c(FALSE, FALSE, FALSE)))
  expect_equal(areIntegers(c(0.995, 1.005), tol = 0.01), c(T, T))
  expect_that(areIntegers(c(pi, sqrt(2))), testthat::equals(c(FALSE, FALSE)))

  expect_equal(areIntegers("jack"), FALSE)
  expect_equal(areIntegers(c("jack", "alf")), c(FALSE, FALSE))
  expect_equal(areIntegers(c("jack", "10")), c(FALSE, TRUE))

  expect_error(areIntegers(c(1, 2), tol = "cabbages"))
  expect_error(areIntegers(c(1, 2), tol = c(0.01, 0.005)))
  expect_error(areIntegers(c(1, 2), na.ignore = c(T, T)))
  expect_error(areIntegers(c(1, 2), na.ignore = "marfanoid"))
  expect_error(areIntegers(c(1, 2), na.ignore = TRUE, tol = "cabbages"))
  expect_error(areIntegers(c(1, 2), na.ignore = "marfanoid", tol = 0.01))
  expect_error(areIntegers(c(1, 2), na.ignore = FALSE, tol = "0.01"))

})

test_that("platform", {
  expect_false(platformIsLinux() & platformIsWindows())
  expect_false(platformIsLinux() & platformIsMac())
  expect_false(platformIsWindows() & platformIsMac())
})

test_that("download zip", {
  url <- "https://github.com/jackwasey/jwutil/archive/v1.0.2.zip"
  read.zip.url(url, filename = "jwutil-1.0.2/NAMESPACE")
})

test_that("permute a vector", {
  v <- 1:4
  expect_that(dim(permute(v)), testthat::equals(c(24, 4)))
  expect_identical(v, unique(v))

  # we can allow up to about 12, which is 500 million rows. If each vector item
  # is a character string, it would still use way too much RAM.
  expect_error(permute(1:20))
})

test_that("recombine a vector", {
  v <- 1:4
  expect_that(dim(permuteWithRepeats(v)), testthat::equals(c(256, 4)))
  expect_identical(v, unique(v))

  # we can allow up to about 12, which is 500 million rows. If each vector item
  # is a character string, it would still use way too much RAM. even 8^8 is
  # quite slow and memory hungry, esp for character vectors
  expect_error(permuteWithRepeats(1:8))
})

test_that("count non na pairs", {
  skip("this is out of control")
  expect_that(countNonNaPairs(cars), is_a("matrix"))
  expect_that(row.names(countNonNaPairs(cars)), equals(c("speed", "dist")))
  expect_that(colnames(countNonNaPairs(cars)), equals(c("speed", "dist")))
  expect_true(all(countNonNaPairs(cars) == 50))
  expect_identical(countNonNaPairs(cars),
                   structure(c(50L, 50L, 50L, 50L), .Dim = c(2L, 2L),
                             .Dimnames = list(c("speed", "dist"),
                                              c("speed", "dist"))))

  c2 <- cars
  c2[1, 1] <- NA
  expect_identical(countNonNaPairs(c2),
                   structure(c(50L, 49L, 49L, 50L), .Dim = c(2L, 2L),
                             .Dimnames = list(c("speed", "dist"),
                                              c("speed", "dist"))))

  c3 <- cars
  c3[1:2, 1] <- NA
  expect_identical(countNonNaPairs(c3),
                   structure(c(50L, 48L, 48L, 50L), .Dim = c(2L, 2L),
                             .Dimnames = list(c("speed", "dist"),
                                              c("speed", "dist"))))
  c4 <- cars
  c4[1, 1:2] <- NA
  expect_identical(countNonNaPairs(c4),
                   structure(c(49L, 49L, 49L, 49L), .Dim = c(2L, 2L),
                             .Dimnames = list(c("speed", "dist"),
                                              c("speed", "dist"))))

  c5 <- cars
  c5[1:2, 1:2] <- NA
  expect_identical(countNonNaPairs(c5),
                   structure(c(48L, 48L, 48L, 48L), .Dim = c(2L, 2L),
                             .Dimnames = list(c("speed", "dist"),
                                              c("speed", "dist"))))

  v <- VADeaths
  expect_identical(
    countNonNaPairs(v),
    structure(c(5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L),
              .Dim = c(4L, 4L),
              .Dimnames = list(
                c("Rural Male", "Rural Female", "Urban Male", "Urban Female"),
                c("Rural Male", "Rural Female", "Urban Male", "Urban Female"))))

  v2 <- v
  v2[1, 1] <- NA
  expect_identical(
    countNonNaPairs(v2),
    structure(c(5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L),
              .Dim = c(4L, 4L),
              .Dimnames = list(
                c("Rural Male", "Rural Female", "Urban Male", "Urban Female"),
                c("Rural Male", "Rural Female", "Urban Male", "Urban Female"))))

})

test_that("list functions in a package", {
  expect_true("runif" %in% lsp(stats))
  expect_true(".checkMFClasses" %in% lsp(stats, all.names = TRUE))
  expect_true("runif" %in% lsp(stats, pattern = "run"))
})

test_that("shuffle reorders a vector", {
  v <- names(longley)
  expect_true(all(v %in% shuffle(v)))
  expect_true(all(shuffle(v) %in% v))
  expect_equal(length(v), length(shuffle(v)))
  v[2] <- NA
  v <- names(longley)
  expect_true(all(v %in% shuffle(v)))
  expect_true(all(shuffle(v) %in% v))
  expect_equal(length(v), length(shuffle(v)))

  v[3] <- NA
  v <- names(longley)
  expect_true(all(v %in% shuffle(v)))
  expect_true(all(shuffle(v) %in% v))
  expect_equal(length(v), length(shuffle(v)))

})
