################################################################################
# Test if trafo functions return the same results as the manually calculated
# values
################################################################################

# Case B: positive values (y1 = 1, y2 = 2) and lambda = 0)

# Fixed optimal parameter and shift (benchmark values)
manual_results <- read.csv("./B_y1_y2_lambda0.csv", sep=";")

test_that("Does the Box-Cox transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2

  # Box-Cox transformation
  yt <- box_cox(2, 0)
  yback <- box_cox_back(yt, 0)
  z <- box_cox_std(y, 0)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "box_cox"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "box_cox"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "box_cox"], 3))
})

test_that("Does the Box-Cox shift transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2

  # Box-Cox transformation
  yt <- box_cox_shift(2, 0)$y
  yback <- box_cox_shift_back(yt, 0)
  z <- box_cox_shift_std(y, 0)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "box_cox"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "box_cox"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "box_cox"], 3))


})


test_that("Does the Modulus transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Modulus transformation
  yt <- modul(2, 0)
  yback <- modul_back(yt, 0)
  z <- modul_std(y, 0)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "modulus"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "modulus"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "modulus"], 3))


})



test_that("Does the Manly transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Manly transformation
  yt <- Manly(2, 0)
  yback <- Manly_back(yt, 0)
  z <- Manly_std(y, 0)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "manly"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "manly"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "manly"], 3))
})


test_that("Does the Dual transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Dual transformation
  yt <- Dual(2, 0)
  yback <- Dual_back(yt, 0)
  z <- Dual_std(y, 0)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "dual"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "dual"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "dual"], 3))
})


test_that("Does the Yeo-Johnson transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Yeo-Johnson transformation
  yt <- Yeo_john(2, 0)
  yback <- Yeo_john_back(yt, 0)
  z <- Yeo_john_std(y, 0)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "yeo_john"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "yeo_john"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "yeo_john"], 3))
})

test_that("Does the Gpower transformation return the correct results?", {

  # Define y vector
  y <- c(1, 2) # n = 2


  # Gpower transformation
  yt <- gPower(2, 0)
  yback <- gPower_back(yt, 0)
  z <- gPower_std(y, 0)

  # Check transformation
  expect_equal(round(yt, 3), round(manual_results[1, "gpower"], 3))
  # Check back-transformation
  expect_equal(yback, y[2])
  # Check standardized transformation
  expect_equal(round(z[1], 3), round(manual_results[2, "gpower"], 3))
  expect_equal(round(z[2], 3), round(manual_results[3, "gpower"], 3))
})

