context("allMissing()")

test_that("allMissing() returns values that we expect", {

  # Start off with a simple data frame that has a few missing values
  d1 <- data.frame(x = c(3,4,NA,1,10,NA), y = c(NA,"b","c","d","e",NA))
  
  # Identify rows were the entire row is missing
  expect_equal(allMissing(d1), c(rep(FALSE, 5), TRUE))
  
  # Only removes rows where all the values are missing
  expect_equal(d1[!allMissing(d1),], d1[-6,])

  # All missing can also be used to identify if any of the
  # columns are 'all missing'
  d2 <- data.frame(x = c(rnorm(3), NA, rnorm(6)), y = rep(NA,10), z = letters[1:10])
  
  # Look for columns that are all missing
  expect_equal(allMissing(d2, byRow = FALSE), c(x = FALSE, y = TRUE, z = FALSE))
          
  ## Remove columns where all the values are missing
  expect_equal(d2[,!allMissing(d2, byRow = FALSE)], d2[,-2])
   
})

