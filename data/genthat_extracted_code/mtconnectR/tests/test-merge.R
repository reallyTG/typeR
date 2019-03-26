
library("testthat")

context("Common: Testing mergeTS Function")
test_that("It should merge the dataframes by taking the carry forwarding the last observation (locf)", {
  input <- list(df1 = data.frame(timestamp = as.POSIXct(c(0.5, 1, 1.008, 1.011) + 1445579573, tz = 'CST6CDT', origin = "1970-01-01"),
                                 x = c('a', 'b', 'c', 'd')),
                df2 = data.frame(timestamp = as.POSIXct(c(0.5, 1.011) + 1445579573, tz = 'CST6CDT', origin = "1970-01-01"),
                                 y = c('e', 'f')))
  
  expected1 <- data.frame(timestamp = as.POSIXct(c(0.5, 1, 1.008, 1.011) + 1445579573,  tz = 'CST6CDT', origin = "1970-01-01"),
                                     x = c("a", "b", "c", "d"), y = c("e", "e", "e", "f"))
  expected2 <- data.frame(timestamp = as.POSIXct(c(0.5, 1, 1.008, 1.011) + 1445579573,  tz = 'CST6CDT', origin = "1970-01-01"),
                          df1 = c("a", "b", "c", "d"), df2 = c("e", "e", "e", "f"))
  
  output1 = mergeTS(DF_list = input, output_DF = TRUE, use_list_names = FALSE)
  expect_equal(output1, expected1)
  expect_equal(mergeTS(DF_list = input, output_DF = TRUE, use_list_names = TRUE), expected2)
  expect_equal(attributes(output1$timestamp[[1]])$tzone %>% unname(), attributes(expected1$timestamp[1])$tzone)
})

context("Multiple Timestamps")
test_that("Multiple Timestamps causes Error", {
  input = list(A = data.frame(timestamp = as.POSIXct("2015-01-03", tz = 'CST6CDT')),
               B = data.frame(timestamp = as.POSIXct("2015-01-02", tz = 'UTC'), value = "A"))
  expect_error(mergeTS(input))

  input = list(A = data.frame(timestamp = as.POSIXct("2015-01-03", tz = 'CST6CDT')),
               B = data.frame(timestamp = as.POSIXct("2015-01-02"), value = "A"))
  expect_error(mergeTS(input))
})

test_that("Timestamps that are null are ignored", {
  input = list(A = data.frame(timestamp = as.POSIXct("2015-01-03", tz = 'UTC')),
               B = data.frame(timestamp = as.POSIXct("2015-01-02"), value = "A"))
  expect_silent(mergeTS(input))
  
  input = list(A = data.frame(timestamp = structure(1493683200, class = c("POSIXct", "POSIXt"))),
               B = data.frame(timestamp = as.POSIXct("2015-01-02"), value = "A"))
  expect_silent(mergeTS(input))
})

test_that("Ignores NULLs", {
  input = list(A = data.frame(timestamp = as.POSIXct("2015-01-03", tz = 'UTC')),
               B = data.frame(timestamp = as.POSIXct("2015-01-02"), value = "A"), 
               C = NULL)
  output = expect_silent(mergeTS(input))
  
})