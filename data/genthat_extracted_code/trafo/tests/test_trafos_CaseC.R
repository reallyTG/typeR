################################################################################
# Test if trafo functions return the same results as the manually calculated
# values
################################################################################

# Case C: positive values (y1 = 1, y2 = 2) and lambda = 0)

# Fixed optimal parameter and shift (benchmark values)
manual_results <- read.csv("./C_y-1_y-2_lambda3.csv", sep=";")


test_that("Does the Yeo-Johnson transformation return the correct results?", {

  # Define y vector
  y <- c(-1, -2) # n = 2


  # Yeo-Johnson transformation
  yt <- Yeo_john(-2, 3)
  yback <- Yeo_john_back(yt, 3)
  z <- Yeo_john_std(y, 3)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "yeo_john"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "yeo_john"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "yeo_john"], 3))
})

