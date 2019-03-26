context("timeStamp()")

test_that("timeStamp() returns values as expected", {

  out <- timeStamp("this", c("txt","R"))

  # Should have length of 2
  expect_true(length(out) == 2)

  # Make sure the filename starts with the expected string
  expect_true(all(substr(out, 1, 5) == "this_"))

  # Make sure the extensions are as we expect
  expect_true(all(getExtension(out) == c("txt", "R")))

  out <- stripExtension(out)

  # Make sure the basenames are equivalent
  expect_true(out[1] == out[2])

  # Remove the basename
  out <- sub("this_", "", out)

  # Make sure the remaining date stamp follows the format we expect
                    #     Y  Y   Y    Y  -  M    M  -  D    D  _  H    H    M    M    S    S 
  expect_true(all(grepl("[2][0][1-5][0-9]-[0-1][0-9]-[0-3][0-9]_[0-2][0-9][0-5][0-9][0-5][0-9]", out)))

  # Check error
  expect_error(timeStamp("this", 7), "Arguments must be character")
  
})
