test_that("we can create a population with dates and select the dates", {
  skip_on_cran()
  df_orig <- data.frame(dates = as.Date(c("1950-05-03", "2018-01-15")))
  name <- sprintf("test_date_populations_%d", round(runif(1, 0, 1000000)))
  pop <- create_population(SESS, df_orig, name)
  df_selected <- select(pop, target = "dates")
  expect_equivalent(df_orig, df_selected)
  delete_population(pop)

  # Try this again, with `POSIXlt`. Check that we get `Date` back.
  df_posixlt <- data.frame(
      dates = as.POSIXlt(c("1950-05-03", "2018-01-15"), tz = "UTC"))
  name <- sprintf("test_date_populations_%d", round(runif(1, 0, 1000000)))
  pop2 <- create_population(SESS, df_posixlt, name)
  df_posixlt_selected <- select(pop2, target = "dates")
  expect_equivalent(df_orig, df_posixlt_selected)
  delete_population(pop2)
})

test_that("we can create a population with times and select the times", {
  skip_on_cran()
  df_orig <- data.frame(times = as.POSIXct(c(1523248045, 1523248067),
                        origin = "1970-01-01", tz = "UTC"))
  name <- sprintf("test_date_populations_times_%d", round(runif(1, 0, 1000000)))
  pop <- create_population(SESS, df_orig, name)
  df_selected <- select(pop, target = "times")
  expect_equivalent(df_orig, df_selected)
  delete_population(pop)
})
