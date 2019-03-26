# Check `data_frame_to_json`, the main function used by `create_population`,
# without actually calling `create_population`.

test_that("ids can be extracted from URLs",  {
  url <- paste("https://betaplatform.empirical.com/rpc/population_model/",
               "pm-b4my56cirthgwaze", sep = "")
  expect_equal(edpclient:::id_from_url(url, "pm-"), "pm-b4my56cirthgwaze")
  expect_error(edpclient:::id_from_url(url, "p-"), "does not start with 'p-'")
  expect_error(edpclient:::id_from_url("arglebargle", "pm-"),
               "does not look like an URL")
})

test_that("numeric stat types are guessed", {
  # Draw from N(2,1) and clip off the non-positive values to generate a vector
  # that is really obviously additive, but not an error to model as
  # multiplicative.
  set.seed(17)
  x <- rnorm(1000, 2, 1)
  x <- x[x > 0]
  # Check that x is additive, but exp(x) is multiplicative.
  expect_equal(edpclient:::guess_numeric_stat_type(x), "realAdditive")
  expect_equal(edpclient:::guess_numeric_stat_type(exp(x)),
               "realMultiplicative")
})

test_that("numeric columns are in POST data and schema", {
  d <- data.frame(x = c(1, 2, NA))
  expected_data <- list(num_rows = 3, columns = list(x = list(1, 2, NA)))
  expected_schema <- list(columns = list(list(name = "x",
                                              stat_type = "realAdditive",
                                              precision = c(1, 1))))
  post_data <- edpclient:::data_frame_to_json(d)
  expect_equal(expected_data, post_data[["data"]])
  expect_equal(expected_schema, post_data[["schema"]])
})

test_that("categorical columns are in POST data and schema", {
  d <- data.frame(x = c("a", "b", "a", NA))
  expected_data <- list(num_rows = 4,
                        columns = list(x = list("a", "b", "a", NA_character_)))
  expected_schema <- list(columns = list(
      list(name = "x", stat_type = "categorical",
           values = list(list(value = "a"), list(value = "b")))))
  post_data <- edpclient:::data_frame_to_json(d)
  expect_equal(expected_data, post_data[["data"]])
  expect_equal(expected_schema, post_data[["schema"]])
})

test_that("ordered categorical columns are in POST data and schema", {
  d <- data.frame(x = ordered(c("X", "Y", "X")))
  expected_data <- list(num_rows = 3, columns = list(x = list("X", "Y", "X")))
  expected_schema <- list(columns = list(
      list(name = "x", stat_type = "orderedCategorical",
           values = list(list(value = "X"), list(value = "Y")))))
  post_data <- edpclient:::data_frame_to_json(d)
  expect_equal(expected_data, post_data[["data"]])
  expect_equal(expected_schema, post_data[["schema"]])
})

test_that("logical columns are in POST data and schema", {
  d <- data.frame(x = c(TRUE, FALSE, NA))
  expected_data <- list(num_rows = 3,
                        columns = list(x = list("TRUE", "FALSE",
                                                NA_character_)))
  expected_schema <- list(columns = list(
      list(name = "x", stat_type = "categorical",
           values = list(list(value = "FALSE"), list(value = "TRUE")))))
  post_data <- edpclient:::data_frame_to_json(d)
  expect_equal(expected_data, post_data[["data"]])
  expect_equal(expected_schema, post_data[["schema"]])
})

test_that("dates are in POST data and schema", {
  d <- data.frame(
      x = as.POSIXlt(c("1970-01-01 UTC", "1969-12-31 UTC", "1971-01-01 UTC"),
                     tz = "UTC"))
  expected_data <- list(num_rows = 3, columns = list(x = list(0, -1, 365)))
  expected_schema <- list(columns = list(list(name = "x", stat_type = "date")))
  post_data <- edpclient:::data_frame_to_json(d)
  expect_equal(expected_data, post_data[["data"]])
  expect_equal(expected_schema, post_data[["schema"]])
})

test_that("unmodeled columns are in POST data and schema", {
  # We don't know what to do with Date objects, but they can be stringified, so
  # you should be able to create a population with them if you mark them
  # "void".
  d <- data.frame(x = c(as.Date("2017-05-18"), NA))
  stat_type(d$x) <- "void"
  expected_data <- list(num_rows = 2,
                        columns = list(x = list("2017-05-18", NA_character_)))
  expected_schema <- list(columns = list(list(name = "x", stat_type = "void")))
  post_data <- edpclient:::data_frame_to_json(d)
  message(expected_data)
  message(post_data[["data"]])
  message(all.equal(expected_data, post_data[["data"]]))
  expect_equal(expected_data, post_data[["data"]])
  expect_equal(expected_schema, post_data[["schema"]])
})

test_that("display names and descriptions are in POST schema", {
  d <- data.frame(x = c(1, 2.5))
  display_name(d$x) <- "XX"
  attr(d$x, "description") <- "X x"
  expected_schema <- list(columns = list(list(name = "x",
                                              stat_type = "realAdditive",
                                              display_name = "XX",
                                              description = "X x")))
  post_data <- edpclient:::data_frame_to_json(d)
  expect_equal(expected_schema, post_data[["schema"]])
})
