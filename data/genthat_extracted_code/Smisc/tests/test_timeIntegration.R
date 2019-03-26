context("timeIntegration()")

test_that("timeIntegration() returns values that are equal to known values", {

  # Load example data
  data(PowerData, package = "Smisc")

  # Known values
  int1c <- 7.48493036166667
  int2c <- 9.6384718225

  # Calculate them
  int1 <- timeIntegration(PowerData,
                          lower = "5/6/2008 17:00:09",
                          upper = "5/6/2008 17:01:36",
                          units = "m")

  int2 <- timeIntegration(PowerData, units = "m")

  # Testing
  expect_equal(int1c, int1)
  expect_equal(int2c, int2)

  # Some other tests
  expect_equal(timeIntegration(c(1,3), c("07-May-2009 15:00", "07-May-2009 16:00")), 2)
  expect_equal(timeIntegration(c(1,3), c("07-May-2009 15:30", "07-May-2009 16:00")), 1)
  expect_equal(timeIntegration(c(1,3), c("07-May-2009 15:30", "07-May-2009 17:30")), 4)

})


